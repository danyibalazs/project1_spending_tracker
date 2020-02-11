require_relative( '../db/sql_runner' )
require_relative( './merchant' )
require_relative( './tag' )
require("date")

class Transaction

  attr_reader :id
  attr_accessor :merchant_id, :tag_id, :amount, :transaction_date

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @merchant_id = options["merchant_id"].to_i()
    @tag_id = options["tag_id"].to_i()
    @amount = options["amount"].to_f()
    @transaction_date = options["transaction_date"]
  end

  def save()
    sql = "INSERT INTO transactions
    (merchant_id, tag_id, amount, transaction_date) VALUES ($1, $2, $3, $4)
    RETURNING id"
    value = [@merchant_id, @tag_id, @amount, @transaction_date]
    result = SqlRunner.run(sql, value)
    @id = result[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE transactions
    SET (merchant_id, tag_id, amount, transaction_date) = ($1, $2, $3, $4)
    WHERE id = $5"
    values = [@merchant_id, @tag_id, @amount, @transaction_date, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM transactions WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def merchant()
    merchant = Merchant.find(merchant_id)
    return merchant
  end

  def tag()
    tag = Tag.find(tag_id)
    return tag
  end

  def self.sort_by_date(transactions)
    transactions.sort_by! {
      |transaction|
      Date.parse(transaction.transaction_date())
    }
    transactions.reverse!
    return transactions
  end

  def self.filter_by_date_range(start_date, end_date)
    start_date = Date.parse(start_date)
    end_date = Date.parse(end_date)
    transactions = self.all()
    filtered_transactions = transactions.select do |transaction|
      transaction_date = Date.parse(transaction.transaction_date)
      start_date < transaction_date && end_date > transaction_date
    end
    return filtered_transactions
  end

  def self.filter_by_merchant(merchant_id)
    sql = "SELECT * FROM transactions
    WHERE merchant_id = $1"
    value = [merchant_id]
    results = SqlRunner.run(sql, value)
    transactions = results.map {|transaction| Transaction.new(transaction)}
    return self.sort_by_date(transactions)
  end

  def self.filter_by_tag(tag_id)
    sql = "SELECT * FROM transactions
    WHERE tag_id = $1"
    value = [tag_id]
    results = SqlRunner.run(sql, value)
    transactions = results.map {|transaction| Transaction.new(transaction)}
    return self.sort_by_date(transactions)
  end

  def self.all()
    sql = "SELECT * FROM transactions"
    results = SqlRunner.run(sql)
    transactions = results.map {|transaction| Transaction.new(transaction)}
    self.sort_by_date(transactions)
    return transactions
  end

  def self.find(id)
    sql = "SELECT * FROM transactions WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    transaction = Transaction.new(result[0])
    return transaction
  end

  def self.delete_all()
    sql = "DELETE FROM transactions"
    SqlRunner.run(sql)
  end

  def self.total_amounts(transactions_array)
    total = 0
    # use maybe reduce?
    transactions_array.each do |transaction|
      total += transaction.amount
    end
    return total
  end

end

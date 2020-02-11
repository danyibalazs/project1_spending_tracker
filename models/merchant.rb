require_relative( '../db/sql_runner' )

class Merchant

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO merchants
    (name) VALUES ($1)
    RETURNING id"
    value = [@name]
    result = SqlRunner.run(sql, value)
    @id = result[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE merchants
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM merchants WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.all()
    sql = "SELECT * FROM merchants"
    results = SqlRunner.run(sql)
    merchants = results.map {|merchant| Merchant.new(merchant)}
    return merchants
  end

  def self.find(id)
    sql = "SELECT * FROM merchants WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    merchant = Merchant.new(result[0])
    return merchant
  end

  def self.delete_all()
    sql = "DELETE FROM merchants"
    SqlRunner.run(sql)
  end

end

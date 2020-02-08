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

end

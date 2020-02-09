require_relative( '../db/sql_runner' )

class User

  attr_reader :name, :budget
  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @budget = options["budget"].to_i()
  end

  def save()
    sql = "INSERT INTO users
    (name, budget) VALUES ($1, $2)
    RETURNING id"
    value = [@name, @budget]
    result = SqlRunner.run(sql, value)
    @id = result[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM users"
    results = SqlRunner.run(sql)
    users = results.map {|user| User.new(user)}
    return users
  end
end

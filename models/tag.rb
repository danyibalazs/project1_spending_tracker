require_relative( '../db/sql_runner' )

class Tag

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO tags
    (name) VALUES ($1)
    RETURNING id"
    value = [@name]
    result = SqlRunner.run(sql, value)
    @id = result[0]["id"].to_i()
  end

  def update()
    sql = "UPDATE tags
    SET name = $1
    WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM tags WHERE id = $1"
    value = [@id]
    SqlRunner.run(sql, value)
  end

  def self.all()
    sql = "SELECT * FROM tags"
    results = SqlRunner.run(sql)
    tags = results.map {|tag| Tag.new(tag)}
    return tags
  end

  def self.find(id)
    sql = "SELECT * FROM tags WHERE id = $1"
    value = [id]
    result = SqlRunner.run(sql, value)
    tag = Tag.new(result[0])
    return tag
  end

  def self.delete_all()
    sql = "DELETE FROM tags"
    SqlRunner.run(sql)
  end

end

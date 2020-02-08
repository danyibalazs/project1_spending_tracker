require("pry-byebug")
require_relative("../models/merchant")
require_relative("../models/tag")

Merchant.delete_all()
Tag.delete_all()

merchant1 = Merchant.new({
  "name" => "Asda"
  })
merchant1.save()

merchant2 = Merchant.new({
  "name" => "Tesco"
  })
merchant2.save()

tag1 = Tag.new({
  "name" => "groceries"
  })
tag1.save()

tag2 = Tag.new({
  "name" => "entertainment"
  })
tag2.save()

binding.pry
nil

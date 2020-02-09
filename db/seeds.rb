require("pry-byebug")
require_relative("../models/merchant")
require_relative("../models/tag")
require_relative("../models/transaction")

Transaction.delete_all()
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

transaction1 = Transaction.new({
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 100
  })
transaction1.save()

transaction2 = Transaction.new({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" => 50
  })
transaction2.save()

transaction3 = Transaction.new({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" => 200
  })
transaction3.save()

binding.pry
nil

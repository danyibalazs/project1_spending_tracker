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

merchant3 = Merchant.new({
  "name" => "Amazon"
  })
merchant3.save()

tag1 = Tag.new({
  "name" => "Groceries"
  })
tag1.save()

tag2 = Tag.new({
  "name" => "Entertainment"
  })
tag2.save()

tag3 = Tag.new({
  "name" => "Clothing"
  })
tag3.save()

transaction1 = Transaction.new({
  "merchant_id" => merchant1.id,
  "tag_id" => tag1.id,
  "amount" => 100,
  "transaction_date" => "2020-02-10"
  })
transaction1.save()

transaction2 = Transaction.new({
  "merchant_id" => merchant3.id,
  "tag_id" => tag3.id,
  "amount" => 30,
  "transaction_date" => "2019-12-20"
  })
transaction2.save()

transaction3 = Transaction.new({
  "merchant_id" => merchant2.id,
  "tag_id" => tag2.id,
  "amount" => 50,
  "transaction_date" => "2020-01-15"
  })
transaction3.save()



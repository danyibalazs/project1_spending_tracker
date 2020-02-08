require("pry-byebug")
require_relative("../models/merchant")

Merchant.delete_all()

merchant1 = Merchant.new({
  "name" => "Asda"
  })
  merchant1.save()

binding.pry
nil

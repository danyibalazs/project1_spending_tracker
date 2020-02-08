require("pry-byebug")
require_relative("../models/merchant")

merchant1 = Merchant.new({
  "name" => "Asda"
  })
  merchant1.save()

binding.pry
nil

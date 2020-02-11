require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  # @transactions.sort_by!{|hash| hash.month}
  @transactions.reverse!
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

post '/transactions/merchant' do
  @filter = Merchant.find(params["merchant_id"]).name()
  @transactions = Transaction.filter_by_merchant(params["merchant_id"])
  @transactions.reverse!
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

post '/transactions/tag' do
  @filter = Tag.find(params["tag_id"]).name()
  @transactions = Transaction.filter_by_tag(params["tag_id"])
  @transactions.reverse!
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

# post '/transactions/month' do
#   @transactions = Transaction.filter_by_month(params["month"])
#   @transactions.reverse!
#   @total = Transaction.total_amounts(@transactions)
#   @merchants = Merchant.all
#   @tags = Tag.all
#   erb ( :"transactions/index" )
# end

get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb ( :"transactions/new" )
end

post '/transactions' do
  transaction = Transaction.new(params)
  transaction.save
  redirect("/transactions")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params["id"].to_i)
  erb (:"transactions/show")
end

post '/transactions/:id/delete' do
  transaction = Transaction.find(params["id"].to_i)
  transaction.delete()
  redirect("/transactions")
end

get '/transactions/:id/edit' do
  @transaction = Transaction.find(params["id"].to_i)
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb (:"transactions/edit")
end

post '/transactions/:id' do
  transaction = Transaction.new(params)
  transaction.update()
  redirect("/transactions")
end

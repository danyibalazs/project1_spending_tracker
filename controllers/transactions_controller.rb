require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

post '/transactions/filter-by-merchant' do
  @filter = Merchant.find(params["merchant_id"]).name()
  @transactions = Transaction.filter_by_merchant(params["merchant_id"])
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

post '/transactions/filter-by-tag' do
  @filter = Tag.find(params["tag_id"]).name()
  @transactions = Transaction.filter_by_tag(params["tag_id"])
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

post '/transactions/filter-by-date-range' do
  @filter = 'from ' + params['start_date'].to_s + ' to ' + params["end_date"].to_s
  @transactions = Transaction.filter_by_date_range(params["start_date"], params["end_date"])
  @total = Transaction.total_amounts(@transactions)
  @merchants = Merchant.all
  @tags = Tag.all
  erb ( :"transactions/index" )
end

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

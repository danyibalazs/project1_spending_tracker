require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  @transactions.reverse!
  @total = Transaction.total_amounts(@transactions)
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
  redirect to("/transactions")
end

get '/transactions/:id' do
  @transaction = Transaction.find(params["id"].to_i)
  erb (:"transactions/show")
end

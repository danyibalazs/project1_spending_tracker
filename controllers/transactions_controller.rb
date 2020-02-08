require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  @transactions.reverse!
  erb ( :"transactions/index" )
end

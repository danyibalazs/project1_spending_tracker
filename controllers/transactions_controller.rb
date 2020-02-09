require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transaction' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  @transactions.reverse!
  @total = Transaction.total_amounts(@transactions)
  erb ( :"transactions/index" )
end

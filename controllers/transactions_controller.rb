require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant' )
require_relative( '../models/tag' )
require_relative( '../models/transaction' )
also_reload( '../models/*' )

get '/transactions' do
  @transactions = Transaction.all()
  erb ( :"transactions/index" )
end

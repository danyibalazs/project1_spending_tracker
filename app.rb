require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')
require_relative('controllers/users_controller')
require_relative( './models/user' )

get '/' do
  @users = User.all()
  erb( :index )
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transactions_controller')
require_relative('controllers/merchants_controller')
require_relative('controllers/tags_controller')

# set(:budget, "hello balazs")
# In erb, use <%= settings.budget %>

get '/' do
  erb( :index )
end

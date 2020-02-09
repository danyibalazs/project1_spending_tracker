require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/user' )
also_reload( '../models/*' )

post '/' do
  user = User.new(params)
  user.save()
  redirect('/')
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/tag' )
also_reload( '../models/*' )

get '/tags' do
  @tags = Tag.all()
  erb ( :"tags/index" )
end

get '/tags/new' do
  erb ( :"tags/new" )
end

post '/tags' do
  merchant = Tag.new(params)
  merchant.save()
  redirect to("/tags")
end

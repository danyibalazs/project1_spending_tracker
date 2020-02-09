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

get '/tags/:id' do
  @tag = Tag.find(params["id"].to_i)
  erb (:"tags/show")
end

post '/tags/:id/delete' do
  tag = Tag.find(params["id"].to_i)
  tag.delete()
  redirect("/tags")
end

get '/tags/:id/edit' do
  @tag = Tag.find(params["id"].to_i)
  erb (:"tags/edit")
end

post '/tags/:id' do
  tag = Tag.new(params)
  tag.update()
  redirect("/tags")
end

require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/merchant' )
also_reload( '../models/*' )

get '/merchants' do
  @merchants = Merchant.all()
  erb ( :"merchants/index" )
end

get '/merchants/new' do
  erb ( :"merchants/new" )
end

post '/merchants' do
  merchant = Merchant.new(params)
  merchant.save()
  redirect to("/merchants")
end

get '/merchants/:id' do
  @merchant = Merchant.find(params["id"].to_i)
  erb (:"merchants/show")
end

post '/merchants/:id/delete' do
  merchant = Merchant.find(params["id"].to_i)
  merchant.delete()
  redirect("/merchants")
end

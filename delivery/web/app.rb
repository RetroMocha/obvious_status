require 'sinatra'
require 'slim'

require_relative '../../app/actions/list_statuses'
require_relative '../../app/actions/create_status'
require_relative '../../app/actions/get_status'

require_relative '../../app/actions/get_user'
require_relative '../../app/actions/list_users'
require_relative '../../app/actions/create_user'

require_relative '../../external/status_jack'
require_relative '../../external/user_jack'

set :slim, :pretty => true

get '/' do
  # get list of statuses 
  action = ListStatuses.new StatusJack.new
  @statuses = action.do

  # get list of users
  action = ListUsers.new UserJack.new
  users = action.do
  @users = {}
  users.each do |user|
    @users[user[:id]] = user
  end

  slim :index
end

get '/:user/create-status' do
  slim :create_status
end

post '/:user/create-status' do
  input = { :user_id => params[:user_id].to_i, :text => params[:text] }
  action = CreateStatus.new StatusJack.new
  @status = action.do input
  redirect '/'
end

get '/sign-up' do
  slim :sign_up
end

post '/sign-up' do
  input = { :handle => params[:handle] }
  action = CreateUser.new UserJack.new
  @user = action.do input
  redirect "/user/#{@user[:id]}"
end

get '/user/:id' do
  input = { :id => params[:id].to_i }
  action = GetUser.new UserJack.new
  @user = action.do input
  slim :get_user
end

get '/status/:id' do
  input = { :id => params[:id].to_i }
  action = GetStatus.new StatusJack.new
  @status = action.do input

  input = { :id => @status[:user_id] }
  action = GetUser.new UserJack.new
  @user = action.do input
  slim :get_status
end

get '/status/:id/update' do
  input = { :id => params[:id] }
  action = GetStatus.new StatusJack.new
  @status = action.do input
  slim :update_status
end

post '/status/:id/update' do
  input = { :id => params[:id], :text => params[:text], :user_id => params[:user_id] }
  action = UpdateStatus.new StatusJack.new
  @status = action.do input
  redirect "/status/#{@status[:id]}" 
end

get '/status/:id/remove' do
  input = { :id => params[:id] }
  action = GetStatus.new StatusJack.new
  @status = action.do input
  slim :remove_status
end

post '/status/:id/remove' do
  input = { :id => params[:id] }
  action = RemoveStatus.new StatusJack.new
  result = action.do input
  if result == true
    redirect '/'
  else
    'ERROR'
  end 
end

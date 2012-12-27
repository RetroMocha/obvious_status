require 'sinatra'
require 'slim'
require 'sequel'
require 'json'

require_relative '../../app/actions/list_statuses'
require_relative '../../app/actions/create_status'
require_relative '../../app/actions/get_status'
require_relative '../../app/actions/update_status'
require_relative '../../app/actions/remove_status'

require_relative '../../app/actions/get_user'
require_relative '../../app/actions/list_users'
require_relative '../../app/actions/create_user'

require_relative '../../external/status_jack'
require_relative '../../external/user_jack'

set :slim, :pretty => true

DB = Sequel.connect 'mysql://127.0.0.1:3306/status?user=root' # this should probably be set as an environment variable
 
MONGO_SESSION = Moped::Session.new ['127.0.0.1:27017'] 
MONGO_SESSION.use 'status' 

get '/status/list' do
  # get list of statuses 
  action = ListStatuses.new StatusJack.new
  JSON.generate action.do
end

post '/status/create' do
  input = { :user_id => params[:user_id].to_i, :text => params[:text] }
  action = CreateStatus.new StatusJack.new
  JSON.generate action.do input
end

get '/status/:id' do
  input = { :id => params[:id].to_i }
  action = GetStatus.new StatusJack.new
  JSON.generate action.do input
end

post '/status/:id/update' do
  input = { :id => params[:id].to_i, :text => params[:text], :user_id => params[:user_id].to_i }
  action = UpdateStatus.new StatusJack.new
  JSON.generate action.do input
end

post '/status/:id/remove' do
  input = { :id => params[:id].to_i }
  action = RemoveStatus.new StatusJack.new
  JSON.generate action.do input
end

get '/user/list' do
  # get list of users
  action = ListUsers.new UserJack.new
  JSON.generate action.do
end

post '/user/create' do
  input = { :handle => params[:handle] }
  action = CreateUser.new UserJack.new
  JSON.generate action.do input
end

get '/user/:id' do
  input = { :id => params[:id].to_i }
  action = GetUser.new UserJack.new
  JSON.generate action.do input
end


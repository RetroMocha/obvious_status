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
  list_statuses = ListStatuses.new StatusJack.new
  JSON.generate list_statuses.execute
end

post '/status/create' do
  create_status = CreateStatus.new StatusJack.new
  result = create_status.execute with_user_id: params[:user_id].to_i, and_text: params[:text] 
  JSON.generate result
end

get '/status/:id' do
  get_status = GetStatus.new StatusJack.new
  result = get_status.execute where_id: params[:id].to_i  
  JSON.generate result
end

post '/status/:id/update' do
  update_status = UpdateStatus.new StatusJack.new
  result = update_status.execute for_status_id: params[:id].to_i, with_text: params[:text], and_user_id: params[:user_id].to_i
  JSON.generate result
end

post '/status/:id/remove' do
  remove_status = RemoveStatus.new StatusJack.new
  result = remove_status.execute where_id: params[:id].to_i 
  output = { :success => result }
  JSON.generate output 
end

get '/user/list' do
  list_users = ListUsers.new UserJack.new
  JSON.generate list_users.execute
end

post '/user/create' do
  create_user = CreateUser.new UserJack.new
  result = create_user.execute with_user_handle: params[:handle] 
  JSON.generate result
end

get '/user/:id' do
  get_user = GetUser.new UserJack.new
  result = get_user.execute where_id: params[:id].to_i 
  JSON.generate result
end


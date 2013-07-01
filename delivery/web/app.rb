require 'sinatra'
require 'slim'
require 'sequel'

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

get '/' do
  # get list of statuses 
  list_statuses = ListStatuses.new StatusJack.new
  @statuses = list_statuses.execute

  # get list of users
  list_users = ListUsers.new UserJack.new
  users = list_users.execute
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
  create_status = CreateStatus.new StatusJack.new
  @status = create_status.execute with_user_id: params[:user_id].to_i, and_text: params[:text] 
  redirect '/'
end

get '/sign-up' do
  slim :sign_up
end

post '/sign-up' do
  create_user = CreateUser.new UserJack.new
  @user = create_user.execute with_user_handle: params[:handle] 
  redirect "/user/#{@user[:id]}"
end

get '/user/:id' do
  get_user = GetUser.new UserJack.new
  @user = get_user.execute where_id: params[:id].to_i 
  slim :get_user
end

get '/status/:id' do
  get_status = GetStatus.new StatusJack.new
  @status = get_status.execute where_id: params[:id].to_i  

  get_user = GetUser.new UserJack.new
  @user = get_user.execute where_id: @status[:user_id] 
  slim :get_status
end

get '/status/:id/update' do
  get_status = GetStatus.new StatusJack.new
  @status = get_status.execute where_id: params[:id].to_i 
  slim :update_status
end

post '/status/:id/update' do
  update_status = UpdateStatus.new StatusJack.new
  @status = update_status.execute for_status_id: params[:id].to_i, with_text: params[:text], and_user_id: params[:user_id].to_i
  redirect "/status/#{@status[:id]}" 
end

get '/status/:id/remove' do
  get_status = GetStatus.new StatusJack.new
  @status = get_status.execute where_id: params[:id].to_i  

  get_user = GetUser.new UserJack.new
  @user = get_user.execute where_id: @status[:user_id] 
  slim :remove_status
end

post '/status/:id/remove' do
  remove_status = RemoveStatus.new StatusJack.new
  result = remove_status.execute where_id: params[:id].to_i 
  if result == true
    redirect '/'
  else
    'ERROR'
  end 
end

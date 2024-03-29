require 'sinatra'

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

get '/' do
  list_statuses = ListStatuses.new(StatusJack.new)
  @statuses = list_statuses.exec

  list_users = ListUsers.new(UserJack.new)
  users = list_users.exec
  @users = {}
  users.each do |user|
    @users[user[:id]] = user
  end

  erb :index
end

get '/:user/create-status' do
  erb :create_status
end

post '/:user/create-status' do
  create_status = CreateStatus.new(StatusJack.new)
  @status = create_status.exec(user_id: params[:user_id].to_i, text: params[:text])
  redirect '/'
end

get '/sign-up' do
  erb :sign_up
end

post '/sign-up' do
  create_user = CreateUser.new(UserJack.new)
  @user = create_user.exec(handle: params[:handle])
  redirect "/user/#{@user[:id]}"
end

get '/user/:id' do
  get_user = GetUser.new(UserJack.new)
  @user = get_user.exec(id: params[:id].to_i)

  erb :get_user
end

get '/status/:id' do
  get_status = GetStatus.new(StatusJack.new)
  @status = get_status.exec(id: params[:id].to_i)
  get_user = GetUser.new(UserJack.new)
  @user = get_user.exec(id: @status[:user_id])

  erb :get_status
end

get '/status/:id/update' do
  get_status = GetStatus.new(StatusJack.new)
  @status = get_status.exec(id: params[:id].to_i)

  erb :update_status
end

post '/status/:id/update' do
  update_status = UpdateStatus.new(StatusJack.new)
  @status = update_status.exec(id: params[:id].to_i, text: params[:text], user_id: params[:user_id].to_i)
  redirect "/status/#{@status[:id]}"
end

get '/status/:id/remove' do
  get_status = GetStatus.new(StatusJack.new)
  @status = get_status.exec(id: params[:id].to_i)
  get_user = GetUser.new(UserJack.new)
  @user = get_user.exec(id: @status[:user_id])

  erb :remove_status
end

post '/status/:id/remove' do
  remove_status = RemoveStatus.new(StatusJack.new)
  result = remove_status.exec(id: params[:id].to_i)
  if result == true
    redirect '/'
  else
    'ERROR'
  end
end

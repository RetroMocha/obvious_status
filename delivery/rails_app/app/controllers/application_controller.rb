require_relative '../../../../app/actions/list_statuses'
require_relative '../../../../app/actions/list_users'

require_relative '../../../../external/status_jack'
require_relative '../../../../external/user_jack'


class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
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

    puts @users.inspect
  end
end

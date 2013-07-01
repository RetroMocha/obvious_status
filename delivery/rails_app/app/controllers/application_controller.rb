require_relative '../../../../app/actions/list_statuses'
require_relative '../../../../app/actions/list_users'

require_relative '../../../../external/status_jack'
require_relative '../../../../external/user_jack'


class ApplicationController < ActionController::Base
  protect_from_forgery

  def index
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

    puts @users.inspect
  end
end

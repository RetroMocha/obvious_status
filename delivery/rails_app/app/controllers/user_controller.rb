require_relative '../../../../app/actions/get_user'
require_relative '../../../../app/actions/create_user'

require_relative '../../../../external/status_jack'
require_relative '../../../../external/user_jack'

class UserController < ActionController::Base
  protect_from_forgery

  def get
    input = { :id => params[:id].to_i }
    action = GetUser.new UserJack.new
    @user = action.execute input
  end

  def sign_up
    if request.post?
      input = { :handle => params[:handle] }
      action = CreateUser.new UserJack.new
      @user = action.execute input
      redirect_to '/' 
    end
  end


end

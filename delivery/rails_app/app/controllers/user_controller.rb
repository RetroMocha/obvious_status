require_relative '../../../../app/actions/get_user'
require_relative '../../../../app/actions/create_user'

require_relative '../../../../external/status_jack'
require_relative '../../../../external/user_jack'

class UserController < ActionController::Base
  protect_from_forgery

  def get
    get_user = GetUser.new UserJack.new
    @user = get_user.execute where_id: params[:id].to_i 
  end

  def sign_up
    if request.post?
      create_user = CreateUser.new UserJack.new
      @user = create_user.execute with_user_handle: params[:handle] 
      redirect_to '/' 
    end
  end


end

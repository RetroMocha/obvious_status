require_relative '../../../../app/actions/create_status'
require_relative '../../../../app/actions/get_status'
require_relative '../../../../app/actions/update_status'
require_relative '../../../../app/actions/remove_status'

require_relative '../../../../app/actions/get_user'

require_relative '../../../../external/status_jack'
require_relative '../../../../external/user_jack'

class StatusController < ActionController::Base
  protect_from_forgery

  def get
    get_status = GetStatus.new StatusJack.new
    @status = get_status.execute where_id: params[:id].to_i  

    get_user = GetUser.new UserJack.new
    @user = get_user.execute where_id: @status[:user_id]
  end

  def create
    if request.post?
      create_status = CreateStatus.new StatusJack.new
      @status = create_status.execute with_user_id: params[:user_id].to_i, and_text: params[:text] 
      redirect_to '/'
    end
  end

  def update
    if request.get?
      get_status = GetStatus.new StatusJack.new
      @status = get_status.execute where_id: params[:id].to_i 
    end
 
    if request.post?
      update_status = UpdateStatus.new StatusJack.new
      @status = update_status.execute for_status_id: params[:id].to_i, with_text: params[:text], and_user_id: params[:user_id].to_i
      redirect_to "/status/#{@status[:id]}" 
    end
  end
  
  def remove
    if request.get?
      get_status = GetStatus.new StatusJack.new
      @status = get_status.execute where_id: params[:id].to_i  

      get_user = GetUser.new UserJack.new
      @user = get_user.execute where_id: @status[:user_id] 
    end

    if request.post?
      remove_status = RemoveStatus.new StatusJack.new
      result = remove_status.execute where_id: params[:id].to_i 
      if result == true
        redirect_to '/'
      else
        'ERROR'
      end 
    end
  end
end

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
    input = { :id => params[:id].to_i }

    action = GetStatus.new StatusJack.new
    puts action.inspect
    @status = action.do input

    input = { :id => @status[:user_id] }
    action = GetUser.new UserJack.new
    @user = action.do input
  end

  def create
    if request.post?
      input = { :user_id => params[:user_id].to_i, :text => params[:text] }
      action = CreateStatus.new StatusJack.new
      @status = action.do input
      redirect_to '/'
    end
  end

  def update
    if request.get?
      input = { :id => params[:id].to_i }
      action = GetStatus.new StatusJack.new
      @status = action.do input
    end
 
    if request.post?
      input = { :id => params[:id].to_i, :text => params[:text], :user_id => params[:user_id].to_i }
      action = UpdateStatus.new StatusJack.new
      @status = action.do input
      redirect_to "/status/#{@status[:id]}" 
    end
  end
  
  def remove
    if request.get?
      input = { :id => params[:id].to_i }
      action = GetStatus.new StatusJack.new
      @status = action.do input
     
      input = { :id => @status[:user_id] }
      action = GetUser.new UserJack.new
      @user = action.do input
    end

    if request.post?
      input = { :id => params[:id].to_i }
      action = RemoveStatus.new StatusJack.new
      result = action.do input
      if result == true
        redirect_to '/'
      else
        'ERROR'
      end 
    end
  end
end

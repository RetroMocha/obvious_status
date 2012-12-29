require_relative '../../app/actions/list_statuses'
require_relative '../../app/actions/create_status'
require_relative '../../app/actions/get_status'
require_relative '../../app/actions/update_status'
require_relative '../../app/actions/remove_status'

require_relative '../../app/actions/get_user'
require '../../app/actions/list_users'
require_relative '../../app/actions/create_user'

require_relative '../../external/status_jack'
require_relative  '../../external/user_jack'

require 'purple_shoes'

Shoes.app :title => 'Status' do
  
  def draw_ui
    action = ListUsers.new UserJack.new
    @users = action.do

    action = ListStatuses.new StatusJack.new
    @statuses = action.do

    para 'Users:'
    @users.each do |user|
      para user[:handle]
      button 'Create Status' do
        window do
          status = edit_box ''
          button 'Create status' do
            action = CreateStatus.new StatusJack.new
            result = action.do :user_id => user[:id], :text => status.text
            owner.clear
            owner.draw_ui    
            close
          end
        end
      end
    end

    para ''
    para 'Latest Status Updates'
    @statuses.each do |status|
      para status[:text]  
    end 

  end

  draw_ui
end

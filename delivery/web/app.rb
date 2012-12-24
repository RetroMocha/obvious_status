require 'sinatra'

require_relative '../../app/actions/list_statuses'

require_relative '../../external/status_jack'


get '/' do
  action = ListStatuses.new StatusJack.new
  @statuses = action.do
  @statuses.to_s
end

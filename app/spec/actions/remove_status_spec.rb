require_relative '../../actions/remove_status'
require_relative '../doubles/status_jack_double'

describe RemoveStatus do

  it 'should remove a status update and return true' do
    remove_status = RemoveStatus.new StatusJackDouble.create :default
    result = remove_status.execute where_id: 1 
    result.should be true
  end
end



require_relative '../../actions/list_statuses'
require_relative '../doubles/status_jack_double'

describe ListStatuses do

  it 'should get a list of status updates and return the hash value' do
    action = ListStatuses.new StatusJackDouble.create :default
    result = action.execute
    result.should eq [
      { :user_id => 1, :text => 'making a sandwich', :id => 1 },
      { :user_id => 1, :text => 'making another sandwich', :id => 2 }
    ]    
  end

end



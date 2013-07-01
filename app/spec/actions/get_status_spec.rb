require_relative '../../actions/get_status'
require_relative '../doubles/status_jack_double'

describe GetStatus do

  it 'should get a status update and return the hash value' do
    get_status = GetStatus.new StatusJackDouble.create :default
    result = get_status.execute where_id: 1 
    result.should eq :id => 1, :user_id => 1, :text => 'making a sandwich'
  end

end



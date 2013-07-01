require_relative '../../actions/update_status'
require_relative '../doubles/status_jack_double'

describe UpdateStatus do

  it 'should update a status and return the hash value' do
    update_status = UpdateStatus.new StatusJackDouble.create :default
    result = update_status.execute for_status_id: 1, with_text: 'making a sandwich', and_user_id: 1 
    result.should eq :id => 1, :text => 'making a sandwich', :user_id => 1
  end

end



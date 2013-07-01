require_relative '../../actions/create_status'
require_relative '../doubles/status_jack_double'

describe CreateStatus do

  it 'should create a status update' do
    create_status = CreateStatus.new StatusJackDouble.create :default
    result = create_status.execute with_user_id: 1, and_text: 'making a sandwich' 
    result.should eq :user_id => 1, :text => 'making a sandwich', :id => 1
  end

end



require_relative '../../actions/update_status'
require_relative '../doubles/status_jack_double'

describe UpdateStatus do

  it 'should update a status and return the hash value' do
    input = { :id => 1, :text => 'making a sandwich', :user_id => 1 }
    action = UpdateStatus.new StatusJackDouble.create :default
    result = action.do input
    result.should eq :id => 1, :text => 'making a sandwich', :user_id => 1
  end

  it 'should raise an error with invalid input' do
    input = { :id => nil, :text => nil, :user_id => nil }
    action = UpdateStatus.new StatusJackDouble.create :default
    expect { action.do input }.to raise_error ArgumentError
  end

end



require_relative '../../actions/get_status'
require_relative '../doubles/status_jack_double'

describe GetStatus do

  it 'should get a status update and return the hash value' do
    input = { :id => 1 }
    action = GetStatus.new StatusJackDouble.create :default
    result = action.do input
    result.should eq :id => 1, :user_id => 1, :text => 'making a sandwich'
  end

  it 'should raise an error with invalid input' do
    input = { :id => nil }
    action = GetStatus.new StatusJackDouble.create :default
    expect { action.do input }.to raise_error ArgumentError
  end

end



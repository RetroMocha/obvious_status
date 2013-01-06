require_relative '../../actions/create_status'
require_relative '../doubles/status_jack_double'

describe CreateStatus do

  it 'should create a status update' do
    input = {
      :user_id => 1,
      :text => 'making a sandwich'
    }
    action = CreateStatus.new StatusJackDouble.create :default
    result = action.do input
    result.should eq :user_id => 1, :text => 'making a sandwich', :id => 1
  end

  it 'should raise an error with invalid input' do
    input = { :user_id => nil, :text => nil }
    action = CreateStatus.new StatusJackDouble.create :default
    expect { action.do input }.to raise_error ArgumentError
  end

end



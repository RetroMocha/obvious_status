require_relative '../../actions/remove_status'
require_relative '../doubles/status_jack_double'

describe RemoveStatus do

  it 'should remove a status update and return true' do
    input = { :id => 1 }
    action = RemoveStatus.new StatusJackDouble.create :default
    result = action.execute input
    result.should be true
  end

  it 'should raise an error with invalid input' do
    input = { :id => nil }
    action = RemoveStatus.new StatusJackDouble.create :default
    expect { action.execute input }.to raise_error ArgumentError
  end

end



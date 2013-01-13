require_relative '../../actions/get_user'
require_relative '../doubles/user_jack_double'

describe GetUser do

  it 'should get a user and return the hash value' do
    input = { :id => 1 }
    action = GetUser.new UserJackDouble.create :default
    result = action.execute input
    result.should eq :handle => 'chef', :id => 1
  end

  it 'should raise an error with invalid input' do
    input = { :id => nil }
    action = GetUser.new UserJackDouble.create :default
    expect { action.execute input }.to raise_error ArgumentError
  end

end



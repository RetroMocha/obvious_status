require_relative '../../actions/create_user'
require_relative '../doubles/user_jack_double'

describe CreateUser do

  it 'should create a new user' do
    input = { :handle => 'chef' }
    action = CreateUser.new UserJackDouble.create :default
    result = action.execute input
    result.should eq :handle => 'chef', :id => 1
  end

  it 'should raise an error with invalid input' do
    input = { :handle => nil }
    action = CreateUser.new UserJackDouble.create :default
    expect { action.execute input }.to raise_error ArgumentError
  end

end



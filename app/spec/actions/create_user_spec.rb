require_relative '../../actions/create_user'
require_relative '../doubles/user_jack_double'

describe CreateUser do

  it 'should create a new user' do
    create_user = CreateUser.new UserJackDouble.create :default
    result = create_user.execute with_user_handle: 'chef' 
    result.should eq :handle => 'chef', :id => 1
  end

end

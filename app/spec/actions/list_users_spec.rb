require_relative '../../actions/list_users'
require_relative '../doubles/user_jack_double'

describe ListUsers do
  it 'should return a list of users' do
    action = ListUsers.new UserJackDouble.create :default
    result = action.execute
    result.should eq [
      { :handle => 'chef', :id => 1 },
      { :handle => 'ninja', :id => 2 }
    ]
  end
end

require_relative '../../actions/list_users'
require_relative '../doubles/user_jack_double'

describe ListUsers do
  it 'should return a list of users' do
    list_users = ListUsers.new UserJackDouble.create :default
    result = list_users.execute
    result.should eq [
      { :handle => 'chef', :id => 1 },
      { :handle => 'ninja', :id => 2 }
    ]
  end
end

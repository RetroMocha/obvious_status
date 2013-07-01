require_relative '../../actions/get_user'
require_relative '../doubles/user_jack_double'

describe GetUser do

  it 'should get a user and return the hash value' do
    get_user = GetUser.new UserJackDouble.create :default
    result = get_user.execute where_id: 1 
    result.should eq :handle => 'chef', :id => 1
  end

end



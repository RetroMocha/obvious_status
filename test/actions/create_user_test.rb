require_relative '../test_helper'
require_relative '../../app/actions/create_user'
require_relative '../doubles/user_jack_double'

class CreateUserTest < Minitest::Test
  def test_valid_input
    create_user = CreateUser.new(UserJackDouble.create :default)
    result = create_user.exec(handle: 'chef')
    assert_equal({handle: 'chef', id: 1}, result)
  end
end

require_relative '../test_helper'
require_relative '../../app/actions/get_user'
require_relative '../doubles/user_jack_double'

class GetUserTest < Minitest::Test
  def test_valid_input
    result = GetUser.new(UserJackDouble.create :default).exec(id: 1)
    assert_equal({handle: 'chef', id: 1}, result)
  end
end

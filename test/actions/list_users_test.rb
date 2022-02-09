require_relative '../test_helper'
require_relative '../../app/actions/list_users'
require_relative '../doubles/user_jack_double'

class ListUsersTest < Minitest::Test
  def test_valid_input
    result = ListUsers.new(UserJackDouble.create(:default)).exec
    expected_output = [
      { handle: "chef", id: 1 },
      { handle: "ninja", id: 2 }
    ]
    assert_equal(expected_output, result)
  end
end

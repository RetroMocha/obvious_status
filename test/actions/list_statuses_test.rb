require_relative '../test_helper'
require_relative '../../app/actions/list_statuses'
require_relative '../doubles/status_jack_double'

class ListStatusesTest < Minitest::Test
  def test_valid_input
    result = ListStatuses.new(StatusJackDouble.create(:default)).exec
    expected_output = [
      { user_id: 1, text: 'making a sandwich', id: 1 },
      { user_id: 1, text: 'making another sandwich', id: 2 }
    ]
    assert_equal(expected_output, result)
  end
end

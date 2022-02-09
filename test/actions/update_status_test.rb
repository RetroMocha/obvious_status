require_relative '../test_helper'
require_relative '../../app/actions/update_status'
require_relative '../doubles/status_jack_double'

class UpdateStatusTest < Minitest::Test
  def test_valid_input
    action = UpdateStatus.new(StatusJackDouble.create :default)
    result = action.exec(id: 1, text: 'making a sandwich', user_id: 1)
    assert_equal({id: 1, text: 'making a sandwich', user_id: 1}, result)
  end
end

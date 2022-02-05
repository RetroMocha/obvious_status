require_relative '../test_helper'
require_relative '../../app/actions/get_status'
require_relative '../doubles/status_jack_double'

class GetStatusTest < Minitest::Test
  def test_valid_input
    result = GetStatus.new(StatusJackDouble.create :default).exec(id: 1)
    assert_equal({id: 1, user_id: 1, text: 'making a sandwich'}, result)
  end
end

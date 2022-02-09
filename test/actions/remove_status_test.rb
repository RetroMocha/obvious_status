require_relative '../test_helper'
require_relative '../../app/actions/remove_status'
require_relative '../doubles/status_jack_double'

class RemoveStatusTest < Minitest::Test
  def test_valid_input
    assert(RemoveStatus.new(StatusJackDouble.create :default).exec(id: 1))
  end
end

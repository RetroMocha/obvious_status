require_relative '../test_helper'
require './app/actions/create_status'
require_relative '../doubles/status_jack_double'

class CreateStatusTest < Minitest::Test
  def test_valid_input
    create_status = CreateStatus.new(StatusJackDouble.create :default)
    result = create_status.exec(user_id: 1, text: 'making a sandwich')
    assert_equal({user_id: 1, text: 'making a sandwich', id: 1}, result)
  end
end

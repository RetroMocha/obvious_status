require_relative '../test_helper'
require_relative '../../app/entities/status'

class StatusTest < Minitest::Test
  def test_valid_input
    status = Status.new(id: 1, user_id: 1, text: 'making a sandwich')
    assert_equal(1, status.id)
    assert_equal(1, status.user_id)
    assert_equal('making a sandwich', status.text)
  end

  def test_invalid_input
    assert_raises Obvious::TypeError do
      Status.new(id: nil, user_id: nil, text: nil)
    end
  end

  def test_existing_shape
    assert_equal({text: String, user_id: Fixnum, id: Fixnum}, Status.shape)
  end
end

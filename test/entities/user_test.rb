require_relative '../test_helper'
require_relative '../../app/entities/user'

class UserTest < Minitest::Test
  def test_valid_input
    user = User.new(handle: 'chef', id: 1)
    assert_equal('chef', user.handle)
    assert_equal(1, user.id)
  end

  def test_invalid_input
    assert_raises Obvious::TypeError do
      User.new(handle: nil, id: nil)
    end
  end

  def test_existing_shape
    assert_equal({handle: String, id: Fixnum}, User.shape)
  end
end

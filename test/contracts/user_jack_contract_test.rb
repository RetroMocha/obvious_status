require_relative '../test_helper'
require_relative '../../app/contracts/user_jack_contract'
require_relative '../doubles/user_jack_double'

class UserJackContractTest < Minitest::Test
  def test_save_valid_input
    result = UserJackDouble.create(:default).save(id: 1, handle: 'chef')
    assert_equal({id: 1, handle: 'chef'}, result)
  end

  def test_save_invalid_input
    assert_raises Obvious::ContractInputError do
      UserJackDouble.create(:default).save({})
    end
  end

  def test_save_invalid_output
    assert_raises Obvious::ContractOutputError do
      UserJackDouble.create(:bad_output).save(id: 1, handle: 'chef')
    end
  end

  def test_get_valid_input
    result = UserJackDouble.create(:default).get(id: 1)
    assert_equal({id: 1, handle: 'chef'}, result)
  end

  def test_get_invalid_input
    assert_raises Obvious::ContractInputError do
      UserJackDouble.create(:default).get({})
    end
  end

  def test_get_invalid_output
    assert_raises Obvious::ContractOutputError do
      UserJackDouble.create(:bad_output).get(id: 1)
    end
  end

  def test_list_valid_input
    expected_output = [
      { handle: "chef", id: 1 },
      { handle: "ninja", id: 2 }
    ]
    assert_equal(expected_output, UserJackDouble.create(:default).list)
  end

  def test_list_invalid_output
    assert_raises Obvious::ContractOutputError do
      UserJackDouble.create(:bad_output).list
    end
  end
end

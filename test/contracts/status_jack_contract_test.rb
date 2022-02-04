require_relative '../test_helper'
require_relative '../../app/contracts/status_jack_contract'
require_relative '../doubles/status_jack_double'

class StatusJackContractTest < Minitest::Test
  def test_save_valid_input
    input = { user_id: 1, text: 'making a sandwich', id: 1 }
    result = StatusJackDouble.create(:default).save(input)
    assert_equal({user_id: 1, text: 'making a sandwich', id: 1}, result)
  end

  def test_save_invalid_input
    assert_raises Obvious::ContractInputError do
      StatusJackDouble.create(:default).save({})
    end
  end

  def test_save_invalid_output
    assert_raises Obvious::ContractOutputError do
      input = { user_id: 1, text: 'making a sandwich', id: 1 }
      StatusJackDouble.create(:bad_output).save(input)
    end
  end

  def test_get_valid_input
    result = StatusJackDouble.create(:default).get(id: 1)
    assert_equal({user_id: 1, text: 'making a sandwich', id: 1}, result)
  end

  def test_get_invalid_input
    assert_raises Obvious::ContractInputError do
      StatusJackDouble.create(:default).get({})
    end
  end

  def test_get_invalid_output
    assert_raises Obvious::ContractOutputError do
      StatusJackDouble.create(:bad_output).get(id: 1)
    end
  end

  def test_list_valid_input
    expected_output = [
      { user_id: 1, text: 'making a sandwich', id: 1 },
      { user_id: 1, text: 'making another sandwich', id: 2 }
    ]
    assert_equal(expected_output, StatusJackDouble.create(:default).list)
  end

  def test_list_invalid_output
    assert_raises Obvious::ContractOutputError do
      StatusJackDouble.create(:bad_output).list
    end
  end

  def test_remove_valid_input
    assert(StatusJackDouble.create(:default).remove(id: 1))
  end

  def test_remove_invalid_input
    assert_raises Obvious::ContractInputError do
      StatusJackDouble.create(:default).remove({})
    end
  end

  def test_remove_invalid_output
    assert_raises Obvious::ContractOutputError do
      StatusJackDouble.create(:bad_output).remove(id: 1)
    end
  end
end

require 'obvious'

require_relative '../entities/status'

class StatusJackContract < Contract
  contracts :save, :get, :list, :remove

  def save_contract input
    input_shape = Status.shape
    output_shape = Status.shape
    call_method :save_alias, input, input_shape, output_shape
  end

  def get_contract input
    input_shape = { :id => Fixnum }
    output_shape = Status.shape
    call_method :get_alias, input, input_shape, output_shape
  end

  def list_contract
    output_shape = [ Status.shape ]
    call_method :list_alias, nil, nil, output_shape
  end

  def remove_contract input
    input_shape = { :id => Fixnum }
    output_shape = true
    call_method :remove_alias, input, input_shape, output_shape
  end
end

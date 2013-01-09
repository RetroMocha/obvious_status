require 'obvious'
require_relative '../entities/user'

class UserJackContract < Contract
  contracts :save, :get, :list

  def save_contract input
    input_shape = User.shape
    output_shape = User.shape
    call_method :save_alias, input, input_shape, output_shape
  end

  def get_contract input
    input_shape = { :id => Fixnum }
    output_shape = User.shape
    call_method :get_alias, input, input_shape, output_shape
  end

  def list_contract
    output_shape = [ User.shape ]
    call_method :list_alias, nil, nil, output_shape
  end
end

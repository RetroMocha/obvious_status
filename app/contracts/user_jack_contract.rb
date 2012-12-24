require 'obvious'
   
class UserJackContract < Contract
  def self.contracts
    ["save", "get"]
  end

  def save_contract input
    input_shape = {}
    output_shape = {}
    call_method :save_alias, input, input_shape, output_shape
  end
    
  def get_contract input
    input_shape = {}
    output_shape = {}
    call_method :get_alias, input, input_shape, output_shape
  end
     
end

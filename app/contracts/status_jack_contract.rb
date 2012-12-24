require 'obvious'
   
class StatusJackContract < Contract
  def self.contracts
    ["save", "get", "list", "remove"]
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
    
  def list_contract input
    input_shape = {}
    output_shape = {}
    call_method :list_alias, input, input_shape, output_shape
  end
    
  def remove_contract input
    input_shape = {}
    output_shape = {}
    call_method :remove_alias, input, input_shape, output_shape
  end
     
end

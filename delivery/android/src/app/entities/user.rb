require 'validation'

class User
  include Validation

  attr_validator :handle, String
  attr_validator :id, Fixnum

  def self.shape
    {
      :handle => String,
      :id => Fixnum
    }
  end

  def populate input
    self.handle = input[:handle]
    self.id = input[:id] 
  end
    
  def to_hash
    {
      :handle => handle,
      :id => id
    }
  end
    
end

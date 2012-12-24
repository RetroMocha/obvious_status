require 'validation'

class Status
  include Validation

  attr_validator :text, String
  attr_validator :user_id, Fixnum 
  attr_validator :id, Fixnum

  # self.shape is useful for contract validation, especially on list and save methods
  def self.shape
    {
      :text => String,
      :user_id => Fixnum,
      :id => Fixnum
    }
  end

  def populate input
    self.text = input[:text]
    self.user_id = input[:user_id]
    self.id = input[:id] 
  end
    
  def to_hash
    {
      :text => text,
      :user_id => user_id,
      :id => id
    } 
  end
    
end

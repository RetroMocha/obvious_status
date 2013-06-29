require 'obvious'

class User < Obvious::Entity

  value :handle, String
  value :id, Fixnum
    
end

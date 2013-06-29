require 'obvious'

class Status < Obvious::Entity

  value :text, String
  value :user_id, Fixnum 
  value :id, Fixnum
   
end


require 'obvious'

class Status < Obvious::Entity
  value :text, String
  value :user_id, Integer
  value :id, Integer
end

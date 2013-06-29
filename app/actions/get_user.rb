require 'obvious'
require_relative '../entities/user'

class GetUser
  include Obvious::Obj

  def initialize user_jack
    @user_jack = user_jack
  end

  define :execute, where_id: [:id, Fixnum] do |input|
   # get the user from the jack
    data = @user_jack.get :id => input[:id]    

    # create/populate User object
    user = User.new
    user.populate data
     
    # return the result
    user.to_hash 
  end

end

require_relative '../entities/user'

class GetUser

  def initialize user_jack
    @user_jack = user_jack
  end

  def do input
    # validate input
    unless input.has_shape? :id => Fixnum
      raise ArgumentError, 'invalid input format'
    end
    
    # get the user from the jack
    data = @user_jack.get :id => input[:id]    

    # create/populate User object
    user = User.new
    user.populate data
     
    # return the result
    user.to_hash 
  end

end

require_relative '../entities/user'

class CreateUser

  def initialize user_jack
    @user_jack = user_jack
  end

  def execute input
    # validate input
    unless input.has_shape? :handle => String
      raise ArgumentError, 'invalid input format'
    end
    
    # set default id and values for new User entity
    input[:id] = -1    

    # create/populate User object
    user = User.new
    user.populate input
    
    # save user to jack
    result = @user_jack.save user.to_hash
 
    # return the result
    result    
  end

end

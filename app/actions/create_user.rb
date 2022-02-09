require 'obvious'
require_relative '../entities/user'

class CreateUser
  include Obvious::Obj

  def initialize user_jack
    @user_jack = user_jack
  end

  define :exec, handle: String do |input|
    # set default id and values for new User entity
    input[:id] = -1

    # create/populate User object
    user = User.new input

    # save user to jack
    result = @user_jack.save user.to_hash

    # return the result
    result
  end
end

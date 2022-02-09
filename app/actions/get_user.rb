require 'obvious'
require_relative '../entities/user'

class GetUser
  include Obvious::Obj

  def initialize user_jack
    @user_jack = user_jack
  end

  define :exec, id: Integer do |input|
   # get the user from the jack
    data = @user_jack.get(id: input[:id])

    # create/populate User object
    user = User.new data

    # return the result
    user.to_hash
  end
end

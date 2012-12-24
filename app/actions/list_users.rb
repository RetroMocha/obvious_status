require_relative '../entities/user'

class ListUsers
  
  def initialize user_jack
    @user_jack = user_jack
  end

  def do
    # get the users from the jack
    data = @user_jack.list

    # create/populate User objects
    data.each do |entry| 
      user = User.new
      user.populate entry  
    end

    # return the result
    data
  end
end

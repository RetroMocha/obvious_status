require_relative '../entities/user'

class ListUsers
  
  def initialize user_jack
    @user_jack = user_jack
  end

  def do
    user_data = @user_jack.list
    validate user_data
    user_data
  end

  def validate user_data
    # create/populate User objects for validation
    user_data.each do |entry| 
      user = User.new
      user.populate entry  
    end
  end
end

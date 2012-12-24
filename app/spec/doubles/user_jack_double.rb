require_relative '../../contracts/user_jack_contract'

class UserJackDouble
  def self.create behavior
    case behavior
    when :bad_output
      UserJack_BadOutput.new
    when :default
      UserJack_Default.new
    end
  end
end

class UserJack_Default < UserJackContract
  def save input
    { :handle => 'chef', :id => 1 }
  end
end

class UserJack_BadOutput < UserJackContract
  def save input
    nil
  end
end


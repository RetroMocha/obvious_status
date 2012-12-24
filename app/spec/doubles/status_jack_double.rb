require_relative '../../contracts/status_jack_contract'

class StatusJackDouble
  def self.create behavior
    case behavior
    when :bad_output
      StatusJack_BadOutput.new
    when :default
      StatusJack_Default.new
    end
  end
end

class StatusJack_Default < StatusJackContract

  def save input
    { :user_id => 1, :text => 'making a sandwich', :id => 1 }
  end

end

class StatusJack_BadOutput < StatusJackContract

  def save input
    nil
  end

end

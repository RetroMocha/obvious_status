require_relative '../entities/status'

class RemoveStatus

  def initialize status_jack
    @status_jack = status_jack
  end

  def do input
    # validate input
    unless input.has_shape? :id => Fixnum
      raise ArgumentError, 'invalid input format'
    end
 
    # remove the Status object and return the result
    @status_jack.remove :id => input[:id]
  end

end

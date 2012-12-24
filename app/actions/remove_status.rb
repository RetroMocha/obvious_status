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
 
    # get the status update from the jack to see that it 
    data = @status_jack.get :id => input[:id]
 
    # create/populate Status object
    status = Status.new
    status.populate data
 
    # remove the Status object
    result = @status_jack.remove :id => input[:id]
 
    # return the result
    result    
  end

end

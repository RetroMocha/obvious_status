require_relative '../entities/status'

class UpdateStatus

  def initialize status_jack
    @status_jack = status_jack
  end

  def do input
    # validate input
    unless input.has_shape? Status.shape
      raise ArgumentError, 'invalid input format'
    end
    
    # get the status update from the jack
    data = @status_jack.get :id => input[:id]
    
    # create/populate Status object
    status = Status.new
    status.populate data
 
    # update the Status object and save
    status.populate input
    result = @status_jack.save status.to_hash
    
    # return the result
    result 
  end

end

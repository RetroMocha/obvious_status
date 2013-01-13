require_relative '../entities/status'

class GetStatus

  def initialize status_jack
    @status_jack = status_jack
  end

  def execute input
    # validate input
    unless input.has_shape? :id => Fixnum
      raise ArgumentError, 'invalid input format'
    end
    
    # get the status update from the jack
    data = @status_jack.get :id => input[:id]
    
    # create/populate Status object
    status = Status.new
    status.populate data
     
    # return the result
    status.to_hash 
  end

end

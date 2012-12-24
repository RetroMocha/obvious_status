require_relative '../entities/status'

class ListStatuses

  def initialize status_jack
    @status_jack = status_jack
  end

  def do
    # get the status updates from the jack
    data = @status_jack.list
 
    # create/populate Status objects
    # we are populating each list item as an entity for validation
    data.each do |info|
      status = Status.new
      status.populate info
    end
 
    # return the result
    data  # if everything is valid we just return what we got back from the jack    
  end

end

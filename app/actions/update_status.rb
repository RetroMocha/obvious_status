require 'obvious'
require_relative '../entities/status'

class UpdateStatus
  include Obvious::Obj

  def initialize status_jack
    @status_jack = status_jack
  end

  define :execute, for_status_id: [:id, Fixnum], with_text: [:text, String], and_user_id: [:user_id, Fixnum] do |input|
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

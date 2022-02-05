require 'obvious'
require_relative '../entities/status'

class UpdateStatus
  include Obvious::Obj

  def initialize status_jack
    @status_jack = status_jack
  end

  define :exec, id: Fixnum, text: String, user_id: Fixnum do |input|
    # get the status update from the jack
    data = @status_jack.get(id: input[:id])

    # Create valid Status object from data source
    status = Status.new data
    updated_data = status.to_hash.merge! input

    # update the Status object and save
    status = Status.new updated_data
    result = @status_jack.save status.to_hash

    # return the result
    result
  end
end

require 'obvious'
require_relative '../entities/status'

class GetStatus
  include Obvious::Obj

  def initialize status_jack
    @status_jack = status_jack
  end

  define :exec, id: Fixnum do |input|
    # get the status update from the jack
    data = @status_jack.get(id: input[:id])

    # create/populate Status object
    status = Status.new data

    # return the result
    status.to_hash
  end
end

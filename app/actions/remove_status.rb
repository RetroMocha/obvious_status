require 'obvious'
require_relative '../entities/status'

class RemoveStatus
  include Obvious::Obj

  def initialize status_jack
    @status_jack = status_jack
  end

  define :execute, where_id: [:id, Fixnum] do |input|
    # remove the Status object and return the result
    @status_jack.remove :id => input[:id]
  end

end

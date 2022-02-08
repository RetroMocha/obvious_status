require_relative '../entities/status'

class ListStatuses
  def initialize status_jack
    @status_jack = status_jack
  end

  def exec
    # get the status updates from the jack
    status_data = @status_jack.list
    validate status_data
    status_data
  end

  def validate status_data
    # create/populate Status objects for validation
    status_data.each do |entry|
      Status.new(entry)
    end
  end
end

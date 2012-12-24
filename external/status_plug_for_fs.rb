require 'json'

class StatusPlugForFs
  def initialize
    @filename = 'data/statuses.json'
  end

  def list
    # open the status file
    contents = File.read @filename

    # parse the json list
    data = JSON.parse contents, :symbolize_names => true
    
    # return the transformed data
    data 
  end
end

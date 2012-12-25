require 'json'

class UserPlugForFs
  def initialize
    @filename = 'data/users.json'
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

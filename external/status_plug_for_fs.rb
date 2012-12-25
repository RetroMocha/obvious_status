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

  def save input 
    # open the tweet file
    contents = File.read @filename

    data = []
    # parse the json list
    file_data = JSON.parse contents, :symbolize_names => true

    new_status = true if input[:id] == -1 # by convention set new_status flag if id == -1

    max_id = -1
    # transform the data if needed
    file_data.each do | status |
      h = status 
      if input[:id] == h[:id]
        h = input
      end
      max_id = h[:id] if h[:id] > max_id
      data << h
    end

    # add data to the list if it's a new status 
    input[:id] = max_id + 1
    data << input if new_status 

    # save the data back to FS
    json_data = JSON.pretty_generate data 
    File.open(@filename, 'w') {|f| f.write(json_data) }

    # return the transformed data
    return input
  end
end

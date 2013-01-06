with_large_stack{require "net/http"}

with_large_stack{require "uri"}

class ApiPlug
  def initialize entity
    @url = 'http://status-api.heroku.com'
    @entity = entity
  end

  def list
    uri = URI.parse"#{@url}/#{@entity}/list"
    response = Net::HTTP.get_response uri
    JSON.parse response.body, :symbolize_names => true
  end

  def get input
    response = Nestful.get "#{@url}/#{@entity}/#{input[:id]}"
    JSON.parse response, :symbolize_names => true
  end

  def save input
    url = "#{@url}/#{@entity}"
    if input[:id] == -1
      url << "/create" 
    else
      url << "/#{@input[:id]}/update"
    end 
    #response = RestClient.post url, input 
    JSON.parse response, :symbolize_names => true
  end

  def remove input
    #response = RestClient.post "#{@url}/#{@entity}/#{input[:id]}/remove", input
    result = JSON.parse response, :symbolize_names => true
    result[:success]
  end
end


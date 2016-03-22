class Brewerydb
  attr_accessor :name, :abv, :ibu, :img_url, :style, :brewery, :location

  def initialize(beer_name)
    #url for call to api
    url = "http://api.brewerydb.com/v2/search?q=#{beer_name}&withBreweries=Y&key=#{ENV["brewerydb_api_key"]}"

    #make the request
    response = HTTParty.get(url)

    #assign the beer attributes from the first item in the JSON response

    response = response["data"][0]


    if response
      @name = response["nameDisplay"]
      @img_url = response["labels"]["medium"]
      @abv = response["abv"]
      @ibu = response["ibu"]
      @style = response["style"]["name"]
      @brewery = response["breweries"][0]["name"]
      @location = response["breweries"][0]["locations"][0]["locality"] + ", " +  response["breweries"][0]["locations"][0]["region"]
    else
      flash[:error] = "Beer not found"
    end

  end
end

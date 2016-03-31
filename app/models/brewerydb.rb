class Brewerydb
  attr_accessor :name, :abv, :ibu, :img_url, :style, :brewery, :location

  def initialize(beer_name)
    # NHO: Do you have to control for case sensitivty / white space at all in this query?
    #url for call to api
    url = "http://api.brewerydb.com/v2/search?q=#{beer_name}&withBreweries=Y&type=beer&key=#{ENV["brewerydb_api_key"]}"

    #make the request
    response = HTTParty.get(url)

    #assign the beer attributes from the first item in the JSON response


    # have to assume users are good
    if response["data"]
      response = response["data"][0]

      # NHO: could simplify these checks with something like: @name = response["nameDisplay"] || "Not Available"
      if response["nameDisplay"]
        @name = response["nameDisplay"]
      else
        @name = "Not Available"
      end

      if response["labels"]
        @img_url = response["labels"]["medium"]
      else
        @img_url = "unavailable.jpg"
      end

      if response["abv"]
        @abv = response["abv"]
      else
        @abv = "Not Available"
      end

      if response["ibu"]
        @ibu = response["ibu"]
      else
        @ibu = "Not Available"
      end

      if response["style"]
        @style = response["style"]["name"]
      else
        @style = "Not Available"
      end

      if response["breweries"][0]["name"]
        @brewery = response["breweries"][0]["name"]
      else
        @brewery = "Not Available"
      end

      if response["breweries"][0]["locations"]
        @location = response["breweries"][0]["locations"][0]["locality"] + ", " +  response["breweries"][0]["locations"][0]["region"]
      else
        @location = "Not Available"
      end
    end
  end
end

class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create!(beer_params)
    redirect_to beers_path
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :brewery, :abv, :img_url, :style)
    end
end

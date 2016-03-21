class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def new
    @beer = Beer.new
  end

  def create
    @beer = Beer.create!(beer_params)
    redirect_to beer_path @beer
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    @beer = Beer.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    redirect_to beer_url @beer
  end

  def destroy
    @beer = Beer.find(params[:id]).destroy
    redirect_to beers_path
  end


  private
    def beer_params
      params.require(:beer).permit(:name, :brewery, :abv, :img_url, :style)
    end
end

class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def new
    redirect_to root_url unless @current_user
    @beer = Beer.new
  end

  def create
    redirect_to root_url unless @current_user
    @found_beer = Brewerydb.new(params[:beer][:name])
    @beer = Beer.create!(name: @found_beer.name, abv: @found_beer.abv, ibu: @found_beer.ibu, img_url: @found_beer.img_url, style: @found_beer.style, brewery: @found_beer.brewery, location: @found_beer.location)
    redirect_to beer_path @beer
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def edit
    redirect_to root_url unless @current_user
    @beer = Beer.find(params[:id])
  end

  def update
    redirect_to root_url unless @current_user
    @beer = Beer.find(params[:id])
    @beer.update(beer_params)
    redirect_to beer_url @beer
  end

  def destroy
    redirect_to root_url unless @current_user
    @beer = Beer.find(params[:id]).destroy
    redirect_to beers_path
  end

  def add_user
    @beer = Beer.find(params[:id])
    @beer.pubs.create(user_id: @current_user.id)
    redirect_to user_url @current_user
  end

  private
    def beer_params
      params.require(:beer).permit(:name, :abv, :ibu, :img_url, :brewery, :style, :location)
    end
end

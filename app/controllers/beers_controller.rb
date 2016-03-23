class BeersController < ApplicationController
  def index
    @beers = Beer.all
  end

  def new
    if !@current_user
      redirect_to root_url
      flash[:error] = "You must be signed in to do that!"
    end
    @beer = Beer.new
  end

  def create
    redirect_to root_url unless @current_user
    @found_beer = Brewerydb.new(params[:beer][:name])
    # if response does not include a beer flash error
    # @found_beer is always something even if it's properties are nil,
    # so must say if a property exists
    if @found_beer.name
      if !Beer.find_by(name: @found_beer.name)
        @beer = Beer.create!(name: @found_beer.name, abv: @found_beer.abv, ibu: @found_beer.ibu, img_url: @found_beer.img_url, style: @found_beer.style, brewery: @found_beer.brewery, location: @found_beer.location)
        # go to that beer show page
        redirect_to beer_url @beer
      else
        # go to all beers
        redirect_to beers_url
        flash[:error] = "That beer already exists!"
      end
    else
      # go to all beers
      redirect_to beers_url
      flash[:error] = "Beer not found!"
    end
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

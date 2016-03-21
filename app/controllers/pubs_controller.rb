class PubsController < ApplicationController

  def create
    @beer = Beer.find(params[:id])
    @pub = Pub.create!(user: @current_user, beer: @beer)
    redirect_to user_url @current_user
  end
end

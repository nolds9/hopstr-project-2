class ReviewsController < ApplicationController
  def new
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.new
  end

  def create
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.create!(review_params)
    @review = @review.update(user_id: @current_user.id)
    redirect_to beer_url @beer
  end

  def edit
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.find(params[:id])
  end

  def update
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.find(params[:id])
    @review.update(review_params)
    redirect_to beer_url @beer
  end

  def destroy
    @beer = Beer.find(params[:beer_id])
    @review = @beer.reviews.find(params[:id]).destroy
    redirect_to beer_url @beer
  end

  private

    def review_params
      params.require(:review).permit(:body)
    end
end

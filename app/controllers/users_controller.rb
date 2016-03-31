class UsersController < ApplicationController
  # NHO: One common practice is to abstract all the times you "find" a user/beer/ other resource into a method
  # that is run before a controller action. i.e:
    # before_action :find_beer, only: [:show, :update, :edit, :destroy]
  # of course you would have to define `find_beer` in this example
  
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    session[:user_id] = @user.id
    redirect_to user_url @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    redirect_to root_url unless @current_user
    @user = User.find(params[:id])
  end

  def update
    redirect_to root_url unless @current_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_url
  end

  def destroy
    redirect_to root_url unless @current_user
    @user = User.destroy(params[:id])
    redirect_to new_user_url
  end

  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end

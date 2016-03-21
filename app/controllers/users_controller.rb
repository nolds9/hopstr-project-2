class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create!(user_params)
    redirect_to user_url @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_url
  end

  def destroy
    @user = User.destroy(params[:id])
    redirect_to new_user_url
  end
  private
    def user_params
      params.require(:user).permit(:name, :username, :email, :password)
    end
end

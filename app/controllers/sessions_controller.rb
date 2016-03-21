class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    input_username = params[:user][:username]
    if User.exists?(username: input_username)
      @user = User.find_by(username: input_username)
      if @user.password === params[:user][:password]
        session[:user_id] = @user.id
        redirect_to user_url @user
      else
        flash[:error] = "Wrong Password!"
        redirect_to new_session_url
      end
    else
      flash[:error] = "Username doesn't exist!"
      redirect_to new_session_url
    end
  end

  def destroy
    reset_session
    flash[:notice] = "You have logged out"
    redirect_to :root
  end

end

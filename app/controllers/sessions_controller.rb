class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to :root
      flash[:success] = "You have successfully logged in!"
    elsif params[:email] == "" || params[:password] == "" || params[:password_confirmation] == ""
      flash.now[:danger] = "Please fill in all fields."
      render :new
    elsif !user.authenticate(params[:password])
      flash.now[:danger] = "The password entered is incorrect."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You are logged out. See you later!"
    redirect_to :root
  end
end

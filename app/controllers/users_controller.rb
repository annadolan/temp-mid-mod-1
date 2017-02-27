class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Your account was created!"
      session[:user_id] = @user.id
      redirect_to :root
    else
      if User.find_by(email: params[:user][:email])
        flash.now[:danger] = "There is already an email address associated with this account."
        render :new
      else
        flash.now[:danger] = "Password confirmation does not match."
        render :new
      end
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

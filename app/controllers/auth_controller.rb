class AuthController < ApplicationController
  def login
  end

  def verify
    @user = User.find_by(name: params[:name])
    if @user && @user.email == params[:email]
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    else
      flash[:login_error] = "Invalid login credentials. Please try again."
      redirect_to :login
    end
  end

  def logout
    session.clear
    redirect_to login_path
  end

end

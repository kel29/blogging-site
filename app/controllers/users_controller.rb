class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    unless params[:user][:name] == "Krista Loven" && params[:user][:email] == "krista.loven.87@gmail.com"
      flash[:invalid_user] = 'Unfortunately we were unable to make you an account. If you already have one, feel free to login.'
    end
    if @user.save
      redirect_to @user
    else
      flash[:invalid_user] = 'Unfortunately we were unable to make you an account. If you already have one, feel free to login.'
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end

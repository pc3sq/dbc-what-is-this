class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Bad email/password combination"
      redirect_to signup_path
    end
  end

  def destroy

  end

  private

  def get_user
    @user = User.find(session[:current_user])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

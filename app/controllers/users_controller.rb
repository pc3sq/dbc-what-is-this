class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def show
    @questions = Question.where(user: @user)
  end

  def update
    @user.update(user_params)
  end

  def destroy
    @user.destroy

    redirect_to root
  end

  private

  def get_user
    @user = User.find(session[:current_user])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

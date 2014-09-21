class UsersController < ApplicationController

  before_action :get_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user] = @user.id
      redirect_to root_path
    else
      flash[:notice] = @user.errors.full_messages.to_sentence
      redirect_to signup_path
    end
  end

  def show
    @questions = Question.where(user: @user)
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def destroy
    @user.destroy

    redirect_to root_path
  end

  private

  def get_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end

class UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]

  def show

  end

  def new
    @user = User.new
  end

  def create

  end

  def destroy

  end
end

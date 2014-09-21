class SessionsController < ActionController::Base

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    if @user && @user.authenticate(params[:user][:password])
      session[:current_user] = @user.id
    else
      flash[:notice] = "Bad email/password combination"
    end
    redirect_to root_path
  end

  def destroy
    session[:current_user] = nil

    redirect_to root_path
  end

end

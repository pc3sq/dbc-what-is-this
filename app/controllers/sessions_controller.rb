class SessionsController < ActionController::Base

  def new
    @user = User.new
  end

  def create
     @user = User.find_by_email params[:email]
    if @user && @user.authenticate(params[:password])
      login @user
      redirect_to user_path(@user)
    else
      flash[:notice] = "Bad email/password combination"
      render :login
    end
  end

  def destroy
    session[:current_user] = nil
  end

end

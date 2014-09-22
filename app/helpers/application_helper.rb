module ApplicationHelper
  def get_current_user
    @user = User.find(session[:current_user])
  end
end

class OauthsController < ActionController::Base

  def new
    redirect_to client.auth_code.authorize_url(:redirect_uri => 'http://wasistdas.herokuapp.com/callback',:scope => 'https://www.googleapis.com/auth/userinfo.email',:access_type => "offline")
  end

  def callback
    if params[:code]
      access_token = client.auth_code.get_token(params[:code], :redirect_uri => 'http://wasistdas.herokuapp.com/callback')

      response = access_token.get('https://www.googleapis.com/oauth2/v1/userinfo?alt=json')

      user_info = JSON.parse(response.body)

      @user = User.find_by(email: user_info["email"])
      if @user
        @user.update(name: user_info["name"])
      else
        @user = User.create(name: user_info["name"], email: user_info["email"], password:'wasistdas', password_digest: 'wasistdas' )
      end
      session[:current_user] = @user.id
    end
    redirect_to root_path
  end

  private

  raise RuntimeError, "You must set CLIENT_ID and CLIENT_SECRET in your server environment." unless ENV['CLIENT_ID'] && ENV['CLIENT_SECRET']

  CLIENT_ID = ENV['CLIENT_ID']
  CLIENT_SECRET = ENV['CLIENT_SECRET']

  def client
    client ||= OAuth2::Client.new(CLIENT_ID, CLIENT_SECRET, {
                  :site => 'https://accounts.google.com',
                  :authorize_url => "/o/oauth2/auth",
                  :token_url => "/o/oauth2/token"
                })
  end

end

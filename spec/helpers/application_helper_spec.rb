require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  it "should return currently signed in user" do
    @user = User.create({ name: "test", email: "test@test.com", password:'test', password_confirmation:'test' })
    session[:current_user] = @user.id
    expect(get_current_user).to be(@user)
  end
end
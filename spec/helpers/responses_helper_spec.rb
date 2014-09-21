require 'rails_helper'

RSpec.describe ResponsesController, :type => :controller do

  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password:"test", password_confirmation:"test")
    session[:current_user] = @user.id
    @question = Question.create(title:'hello world', caption:'hello', image_path:'http://i.imgur.com/cDakD23.gif', user_id: @user.id)
    @myresponse = Response.create(content:'hello world', question: @question, user: @user)
  end

  it "#mark_as_best should add the response as 'best response' to question" do
    post :mark_as_best, id: @myresponse
    expect(Question.last.best_response).to eq(@myresponse)
  end

end

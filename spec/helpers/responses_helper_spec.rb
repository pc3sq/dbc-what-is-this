require 'rails_helper'

RSpec.describe ResponsesHelper, :type => :helper do

  it "#mark_as_best should return true" do
    @user = User.create(name: "test", email: "test@test.com", password:"test", password_confirmation:"test")
    @question = Question.create(title:'hello world', caption:'hello', image_path:'http://i.imgur.com/cDakD23.gif', user_id: @user.id)
    @myresponse = Response.create(content:'hello world', question_id: @question.id, user_id: @user.id)
    @question.update(response_id: @myresponse.id)
    expect(best_response?(@myresponse)).to be_truthy
  end

end

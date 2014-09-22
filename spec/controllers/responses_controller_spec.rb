require 'rails_helper'

RSpec.describe ResponsesController, :type => :controller do

  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password:"test", password_confirmation:"test")
    session[:current_user] = @user.id
    @question = Question.create(title:'hello world', caption:'hello', image_path:'http://i.imgur.com/cDakD23.gif', user_id: @user.id)
    @myresponse = Response.create(content:'hello world', question: @question, user: @user)
  end

  describe "response panel success" do

    context "#create" do

      it "creates a response with valid params" do
        post :create, question_id: @question, response: { content:'hello world', user_id: @user.id }
        expect(response).to redirect_to("/questions/#{@myresponse.question.id}")
      end

    end

    context "#update" do

      it "updates a question with valid params" do
        put :update, id: @myresponse, response: { content: 'hello world nathan' }
        expect(response).to redirect_to("/questions/#{Response.last.question.id}")
      end

      it "doesn't update a question when params are invalid" do
        put :update, id: @myresponse, response: { content: '' }
        expect(response).to render_template(:edit)
      end

    end

    context "#destroy" do

      it "should delete the response" do
        expect{ delete :destroy, id: @myresponse }.to change(Response,:count).by(-1)
      end

      it "should redirect user to admin posts" do
        delete :destroy, id: @myresponse
        expect(response).to redirect_to("/questions/#{@question.id}")
      end

    end

    context "#up_vote" do

      it "should create a new vote for the response" do
        post :up_vote, id: @myresponse
        expect(response).to be_success
      end

    end

    it "#mark_as_best should add the response as 'best response' to question" do
      post :mark_as_best, id: @myresponse
      expect(Question.last.best_response).to eq(@myresponse)
    end

  end

end

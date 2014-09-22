
require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password:"test", password_confirmation:"test")
    session[:current_user] = @user.id
    @question = Question.create(title:'hello world', caption:'hello', image_path:'http://i.imgur.com/cDakD23.gif', user_id: @user.id)
    @myresponse = Response.create(content:'hello world', question_id: @question.id, user_id: @user.id)
    @comment = Comment.create(body: "my comment", response_id: @myresponse.id, user_id: @user.id)
  end

  describe "comment test success" do

  	it "comments#new" do
    	get :new, response_id: 1
   		expect(assigns(:comment)).to be_a Comment
  	end

    context "#create" do
    	it "creates a comment with valid params" do
        expect{
          post :create, response_id: @myresponse, comment: { body: "what is it", user_id: @user_id }
          }.to change(Comment, :count).by(1)
      end
    end

    context "comments#create" do

      it "does not create a comment when params are invalid" do
      	expect{
          post :create, response_id: @myresponse, comment: { body: nil, user_id: @user_id }
          }.to change(Comment, :count).by(0)
      end
    end

    context "#update" do

      it "it updates a comment when params are valid" do
        put :update, id: @comment, comment: {body: "This is a great comment!"}
        expect(response).to redirect_to("/questions/#{Comment.last.response.question.id}")
      end

      it "it does not update a comment when params are invalid" do
        put :update, id: @comment, comment: {body: nil}
        expect(response).to redirect_to("/questions/#{Comment.last.response.question.id}")
      end

    end

    it "#destroy should delete the comment" do
      expect { delete :destroy, id: @comment }.to change(Comment,:count).by(-1)
    end

    it "should redirect user to admin comments" do
      delete :destroy, id: @comment
      expect(response).to redirect_to("/questions/#{@myresponse.question.id}")
    end

  end

end

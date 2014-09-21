
require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  let(:comment){Comment.new(body: "This is a great comment!",
                        user_id: 2,
                        response_id: 2)
              }

  # let(:response){Response.create(content: "This is a great response!",
  #                       user_id: 1,
  #                       question_id: 1)
  #             }

  describe "comment test success" do

  	it "comments#new" do
    	get :new, response_id: 2
   		expect(assigns(:comment)).to be_a Comment
      expect(response).to render_template(:new)
  	end
  end

 
    context "comments#create" do
    	it "creates a comment with valid params" do
        post :create, comment: ({response_id: 1, user_id: 1, body: "what is it"} )

        expect(response).to change{Comment.count}.by(1)
    	end
  	end

      it "does not create a comment when params are invalid" do
      	post :create, {response_id: 1, comment: {body: nil} }
        expect(response).to render_template(:new)
    end

    # context "#create" do
    #   it "creates a comment with valid params" do
    #     expect {
    #       post :create, :response_id { response_id: 1, comment: {body: "New comment!"} }
    #       }.to change{Comment.count}.by(1)
    #   end
    # end

      # context "#update" do
      #   before(:each) do

      #     @comment = Comment.create({body: "This is a great comment!"})
      #   end

      #   it "it updates a comment when params are valid" do
      #     put :update, id: @comment, comment: {body: "This is a great comment!"}
      #     expect(response).to redirect_to #ask peter
      #   end

      #   it "it does not update a comment when params are invalid" do
      #     put :update, id: @comment, comment: {body: nil}
      #     expect(response).to render_template(:edit)
      #   end
      # end

      # it "#destroy" do
      #   comment = Comment.new
      #   comment.body = "greate comment"
      #   comment.save
      #   num_comments = Comment.count
      #   expect { delete :destroy, :id => comment }.to change { Comment.count }.from(num_comments).to(num_comments-1) #BUGBUG
      # end
end


require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  @comment = Comment.new( body: "This answer isn't right",
                          user_id: 2, 
                          response_id: 2)

  describe 'comments controller' do

    it '#new' do
      get :new
      expect(assigns(@comment)).to be_a_new(Comment)
    end

    it '#create' do

    end

    it '#update' do

    end

    it '#destroy' do

    end

    it 'private #comment_params' do

      #To test a private method, you can use #send on a factory or instance of the comment class.

    end

    it 'private #set_comment' do 

    end

  end

end

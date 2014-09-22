require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  describe "question panel success" do

    it "index" do
      get :index
      expect(assigns(:questions)).to eq Question.all.order('created_at DESC')
    end

    it "show" do
      @question = Question.create(title:'hello world', image_path:'http://i.imgur.com/cDakD23.gif')
      get :show, id: @question.id
      expect(response).to render_template(:show)
    end

    context "#create" do
      before(:each) do
        user = User.create(name: "test", email: "test@test.com", password:"test", password_confirmation:"test")
        session[:current_user] = user.id
      end
      it "creates a question with valid params" do
        post :create, question: {title:'hello world', image_path:'http://i.imgur.com/cDakD23.gif'}
        expect(response).to redirect_to("/questions/#{Question.last.id}")
      end
      it "doesn't create a question when params are invalid" do
        post :create, question: {title: ''}
        expect(response).to render_template(:index)
      end
    end

    context "#update" do
      before(:each) do
        @question = Question.create({ title:'hello world', image_path:'http://i.imgur.com/cDakD23.gif' })
      end

      it "updates a question with valid params" do
        put :update, id: @question, question: {title: 'hello', image_path:'http://i.imgur.com/cDakD23.gif'  }
        expect(response).to redirect_to("/questions/#{@question.id}")
      end
      it "doesn't update a question when params are invalid" do
        put :update, id: @question, question: {title: '', image_path:'' }
        expect(response).to render_template(:edit)
      end
    end

    context "#destroy" do
      before(:each) do
        @question = Question.create({ title:'hello world', image_path:'http://i.imgur.com/cDakD23.gif' })
      end

      it "should delete the question" do
        expect{ delete :destroy, id: @question }.to change(Question,:count).by(-1)
      end
      it "should redirect user to admin posts" do
        delete :destroy, id: @question
       expect(response).to redirect_to("/questions")
      end
    end
  end
end

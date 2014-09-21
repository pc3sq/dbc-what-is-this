require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "user panel success" do

    it "#new" do
      get :new
      expect(assigns(:user)).to be_a User
      expect(response).to render_template(:new)
    end

    context "#create" do
      it "creates a user with valid params" do
        post :create, user: { name: "test", email: "test@test.com", password:'test', password_confirmation:'test' }
        expect(response).to redirect_to(:root)
      end
      it "doesn't create a user when params are invalid" do
        post :create, user: { name:"test", email:"test", password:'test', password_confirmation:'test' }
        expect(response).to redirect_to('/signup')
      end
    end

    context "#update" do
      it "updates a user with valid params" do
        @user = User.create({ name: "test", email: "test@test.com", password:'test', password_confirmation:'test' })
        put :update, id: @user, user: { name: "test2", email: "test2@test.com", password:'test2', password_confirmation:'test2' }
        expect(response).to redirect_to("/users/#{@user.id}")
      end
    end

    context "#destroy" do
      before(:each) do
        @user = User.create({ name: "test", email: "test@test.com", password:'test', password_confirmation:'test' })
      end

      it "should delete the user" do
        expect{ delete :destroy, id: @user }.to change(User,:count).by(-1)
      end
      it "should redirect user to root" do
        delete :destroy, id: @user
       expect(response).to redirect_to(:root)
      end
    end
  end
end

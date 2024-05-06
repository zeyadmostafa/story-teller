
require 'rails_helper'

RSpec.describe Api::V1::PostsController, type: :controller do
    describe "POST #create" do
      it "creates a new post" do
        user = create(:user)
        post :create, params: { post: { title: "Test Post", body: "Test Body", user_id: user.id } }
        expect(response).to have_http_status(:created)
      end
    end
  
    describe "GET #index" do
      it "returns a list of user posts" do
        user = create(:user)
        get :index, params: { user_id: user.id }
        expect(response).to have_http_status(:success)
      end
    end
  
    describe "GET #top" do
      it "returns a list of top posts" do
        get :top
        expect(response).to have_http_status(:success)
      end
    end
  end
  
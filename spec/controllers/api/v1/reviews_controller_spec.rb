# spec/controllers/api/v1/reviews_controller_spec.rb

require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new review" do
        user = create(:user)
        post_obj = create(:post)
        post :create, params: { review: { rating: 5, comment: "Great post!", user_id: user.id, post_id: post_obj.id } }
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new review without a rating" do
        user = create(:user)
        post_obj = create(:post)
        post :create, params: { review: { rating: nil, comment: "Great post!", user_id: user.id, post_id: post_obj.id } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a new review without a comment" do
        user = create(:user)
        post_obj = create(:post)
        post :create, params: { review: { rating: 5, comment: "", user_id: user.id, post_id: post_obj.id } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a new review without a user_id" do
        post_obj = create(:post)
        post :create, params: { review: { rating: 5, comment: "Great post!", user_id: nil, post_id: post_obj.id } }
        expect(response).to have_http_status(:unprocessable_entity)
      end

      it "does not create a new review without a post_id" do
        user = create(:user)
        post :create, params: { review: { rating: 5, comment: "Great post!", user_id: user.id, post_id: nil } }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end

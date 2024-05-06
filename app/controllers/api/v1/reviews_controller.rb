class Api::V1::ReviewsController < ApplicationController
  def create
    review = Review.new(review_params)
    if review.save
      render json: { message: "Review added successfully" }, status: :created
    else
      render json: { error: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :user_id, :post_id)
  end
end

class Api::V1::PostsController < ApplicationController
  def create
    post = Post.new(post_params)
    if post.save
      render json: { message: "Post created successfully" }, status: :created
    else
      render json: { error: post.errors.full_messages }, status: :unprocessable_entity
    end
  end


  def index
    begin
      posts = Post.where(user_id: params[:user_id])
    if posts.any?
      @posts = posts.paginate(page: params[:page], per_page: 10)
      render json: @posts
    else
      render json: { error: "No posts found" }, status: :not_found
    end
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end


  def top
    begin
      top_posts = Post.joins(:reviews).group(:id).order('AVG(reviews.rating) DESC')
    if top_posts.any?
      @top_posts = top_posts.paginate(page: params[:page], per_page: 10)
      render json: @top_posts
    else
      render json: { error: "No posts found" }, status: :not_found
    end
    rescue => e
      render json: { error: e.message }, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end

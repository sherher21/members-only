class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_param)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
  end

  def index
  end

  private
    def post_param
      params.require(:post).permit(:title, :body)
    end
end

class PostsController < ApplicationController
  before_action :authorize, only: [:new]

  def index
    @posts = Post.all.page(params[:page])
  end

  def new
    @user = User.find(session[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = Post.new(post_params)
    if @post.save
      flash[:alert] = "Post successfully created."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post not created, please check your submission."
      redirect_to '/posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def vote
    @post = Post.find(params[:post_id])
    @user = User.find(session[:user_id])
    @response = Response.find(params[:format])
    Vote.create(user_id: @user.id, response_id: @response.id, count: 1)
    redirect_to post_path(@post)
  end

private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
  def vote_params
    params.require(:vote).permit(:user_id, :response_id, :count)
  end
end

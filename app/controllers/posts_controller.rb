class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @user = User.find(session[:user_id])
    @post = Post.new
  end

  def create
    @user = User.find(session[:user_id])
    @post = Post.new(post_params)
    if @post.save
      flash[:alert] = "Post successfly created."
      redirect_to post_path(@post)
    else
      flash[:alert] = "Post not created, please check your submission."
      redirect_to '/posts/new'
    end
  end

  def show
    @post = Post.find(params[:id])
  end


private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end

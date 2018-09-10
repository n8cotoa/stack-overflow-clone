class ResponsesController < ApplicationController
  def new
    @response = Response.new
    @post = Post.find(params[:post_id])
    @user = User.find(session[:user_id])
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(session[:user_id])
    @response = Response.new(response_params)
    if @response.save
      flash[:alert] = "Response successfully posted"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Response not created, please check your submission."
      redirect_to new_post_response_path(@post)
    end
  end

  def destroy
    @response = Response.find(params[:id])
    @response.destroy
    redirect_to post_path(params[:post_id])
  end

private
  def response_params
    params.require(:response).permit(:comment, :user_id, :post_id)
  end
end

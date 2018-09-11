class AdminController < ApplicationController
  before_action :authorize_admin

  def index
    @posts = Post.all
    @users = User.all
    @responses = Response.all
    @number_of_posts_from_today = Post.count_today
    @number_of_responses_from_today = Response.count_today
  end

  def toggle
    @user = User.find(params[:format])
    @user.toggle_admin_status
    redirect_to '/admin'
  end

end

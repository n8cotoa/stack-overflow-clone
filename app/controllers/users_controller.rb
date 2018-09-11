class UsersController < ApplicationController
  before_action :authorize, only: [:show]
  before_action :authorize_user_page, only: [:show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You've successfully signed up!"
      session[:user_id] = @user.id
      redirect_to "/signup"
    else
      flash[:alert] = "There was a problem signing up"
      redirect_to '/signup'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      flash[:alert] = "🤬🤬🤬🤬🤬 #{@user.name}, please stop trying to delete yourself!! 🤬🤬🤬🤬🤬"
      redirect_to '/admin'
    else
      @user.destroy
      redirect_to '/admin'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :permission)
  end
end

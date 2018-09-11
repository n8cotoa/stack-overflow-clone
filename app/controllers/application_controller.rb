class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def authorize
    if !current_user
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/signin'
    end
  end

  def authorize_user_page
    if current_user.id != params['id'].to_i && current_user.permission != 'admin'
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/signin'
    end
  end

  def authorize_admin
    if current_user.permission != 'admin'
      flash[:alert] = "You aren't authorized to visit that page."
      redirect_to '/'
    end
  end
end

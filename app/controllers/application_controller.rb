class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #before_action :login_check

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

private

  def login_check
    if (session[:user_id].blank?)
      redirect_to root_path
    end
  end
end

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :is_user_logged_in

  def is_user_logged_in
    if session[:current_user].nil?
      @logged_in_user = false
    else
      @logged_in_user = true
    end
  end
end

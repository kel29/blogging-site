class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :admin_logged_in?, :redirect

  def redirect(location)
    redirect_to location unless admin_logged_in?
  end

  def admin_logged_in?
    session[:user_id]
  end

end

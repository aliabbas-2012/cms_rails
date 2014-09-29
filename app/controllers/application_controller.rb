class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
  def confirmed_login
    unless session[:user_id]
      flash[:notice] = 'Please Login !'
      redirect_to(:controller => 'demo', :action => 'login')
      return false
    else
      return true
    end
  end

  def current_admin_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_admin_user
  def destroy_session_path
    return url_for(controller: 'demo', action: 'logout')
  end

  helper_method :destroy_session_path
end

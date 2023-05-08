class ApplicationController < ActionController::Base
  helper_method :current_user, :navbar_bg_color
  
  private
  
  def redirect_with_alert
    redirect_to root_path, alert: 'Вам сюда нельзя!'
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def navbar_bg_color
    if session[:user_id]
      current_user.navbar_bg_color
    else
      '#370617'
    end
  end
end

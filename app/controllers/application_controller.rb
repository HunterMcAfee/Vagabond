class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private
  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to new_user_session_path, notice: "Please Login to view that page!"
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end

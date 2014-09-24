class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_devise_params, if: :devise_controller?
  def configure_devise_params
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:user, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me)
    end

    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:user, :first_name, :last_name, :email, :current_password, :password, :password_confirmation, :remember_me)
    end
  end
end

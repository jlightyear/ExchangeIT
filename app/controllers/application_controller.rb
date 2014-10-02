class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    flash[:error] = "You cannot perform the action #{exception.query} according to the #{policy_name}."
    redirect_to(request.referrer || new_user_session_path)
  end

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

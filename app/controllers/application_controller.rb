class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protect_from_forgery unless: -> { request.format.json? }

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_added_attrs = [:username, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name]

    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_added_attrs)

    update_added_attrs = [:username, :password, :password_confirmation, :current_password]
    devise_parameter_sanitizer.permit(:account_update, keys: update_added_attrs)
  end
end

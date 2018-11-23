class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def sign_out_admin_user!
    sign_out current_user if admin_user_signed_in?
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(User) ? user_profile_path(resource) : admin_root_path
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end

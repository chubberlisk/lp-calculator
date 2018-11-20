class ApplicationController < ActionController::Base
  def sign_out_admin_user!
    sign_out current_user if admin_user_signed_in?
  end

  def after_sign_in_path_for(resource)
    resource.is_a?(User) ? root_path : admin_root_path
  end
end

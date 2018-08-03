class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile_no, :address])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :mobile_no, :address, :email, :password, :current_password) }
  end

  def after_sign_in_path_for(resource)
  	librarians_path
  end

end
class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def record_not_found
    if librarian_signed_in?
    	render file: File.join(Rails.root, 'public', '404.html') and return
    elsif root_path
    	render file: File.join(Rails.root, 'public', '404.html') and return
    end
  end

  def internal_server_error
    render file: File.join(Rails.root, 'public', '500.html')
  end

  protected
	  def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :mobile_no, :address])
	    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :mobile_no, :address, :email, :password, :current_password) }
	  end

	  def after_sign_in_path_for(resource)
	  	librarians_path
	  end

end
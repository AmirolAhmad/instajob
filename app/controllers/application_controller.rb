class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #redirect user to login page after sign out
  def after_sign_out_path_for(resource)
	  login_path
	end

	#redirect user to profile page after sign in
	def after_sign_in_path_for(resource)
	  profile_path
	end

  #redirect user to profile page after profile update
  def after_update_path_for(resource)
    accounts_settings_path
  end

	# permit user to login with username or email
	before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit :username, :email, :password, :password_confirmation
    end
  end
end

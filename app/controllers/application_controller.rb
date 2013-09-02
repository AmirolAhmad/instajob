class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	#redirect user to login page after sign out
  	def after_sign_out_path_for(resource)
	  session_path(resource_name)
	end

	def after_sign_in_path_for(resource)
	  profile_path
	end
end

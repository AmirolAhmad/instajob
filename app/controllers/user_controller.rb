class UserController < ApplicationController
  before_filter :authenticate_member!

  def show
  	if member_signed_in?
  		new_user_path
  	elsif 
  		session_path(resource_name)
  	end
  end

  def edit
  	if member_signed_in?
  		settings_profile_path
  	elsif 
  		session_path(resource_name)
  	end
  end

  def credential
    if member_signed_in?
      settings_credential_path
    elsif 
      session_path(resource_name)
    end
  end

end

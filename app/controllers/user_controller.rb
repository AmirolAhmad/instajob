class UserController < ApplicationController
  before_filter :authenticate_member!

  def show
  	@member = current_member
  end

  def edit
  	@member = current_member
  end
  
  def credential
    @member = current_member
  end

  def update_password
    # we can just refer to current_member since its already provided by Devise
    if current_member.update_with_password(member_params)
      # Sign in the member by passing validation in case his password changed
      sign_in current_member, :bypass => true
      redirect_to settings_profile_path
    else
      render "edit"
    end
  end

  private

  def member_params
    params.required(:member).permit(:password, :password_confirmation, :current_password)
  end

end

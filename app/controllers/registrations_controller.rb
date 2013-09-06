class RegistrationsController < Devise::RegistrationsController
  def update
    @member = Member.find(current_member.id)

    successfully_updated = if needs_password?(@member, params)
      @member.update_with_password(params[:member])
    else
      # remove the virtual current_password attribute update_without_password
      # doesn't know how to ignore it
      params[:member].delete(:current_password)
      @member.update_without_password(params[:member])
    end

    if successfully_updated
      set_flash_message :notice, :updated
      # Sign in the member bypassing validation in case his password changed
      sign_in @member, :bypass => true
      redirect_to after_update_path_for(@member)
    else
      render "edit"
    end
  end

  private

  # check if we need password to update member data
  # ie if password or email was changed
  # extend this as needed
  def needs_password?(member, params)
    member.email != params[:member][:email] ||
      params[:member][:password].present?
  end

  # redirect user after update profile
  def after_update_path_for(resource)
    settings_profile_path
  end

end
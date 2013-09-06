class Member::ParameterSanitizer < Devise::ParameterSanitizer
    private
    def account_update
        default_params.permit(
            :first_name,
            :last_name,
            :username,
            :email,
            :password,
            :password_confirmation,
            :current_password
            )
    end

    def sign_up
    	default_params.permit(
            :first_name,
            :last_name,
            :username,
            :email,
            :password,
            :password_confirmation
            )
    end

    def sign_in
    	default_params.permit(
            :username,
            :email,
            :password,
            :remember_me
            )
    end
end
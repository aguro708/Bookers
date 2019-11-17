class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :require_login
        def after_sign_in_path_for(resource)
            flash[:notice]="successfully"
        mypage_path(resource)
    end
    def require_login
        unless current_user
        redirect_to new_user_session_path
        end
    end

    def after_sign_up_path_for(resource)
        flash[:notice]="successfully"
        mypage_path(resource)
    end
    def after_sign_out_path_for(resource)
        flash[:notice]="successfully"
        root_path
    end
    Refile.secret_key = '2dc4fdf6e5a0f96dc1cd730cbf457d58fcc15871882df06d93a793f4cf03aa27ed0523c8a995d59f67c26aaab5d729d0cdea00b1fc8a28210df8a5793c9dd474'

	private
	def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
	end
end


class ApplicationController < ActionController::Base
    helper_method :admin_signed_in?
    
    private
  
    def admin_signed_in?
      user_signed_in? && current_user.try(:admin?)
    end
  
    def authenticate_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "You need to be an Administrator to do this!"
        redirect_to root_path, status: :found
      end
    end
end

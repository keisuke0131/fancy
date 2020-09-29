class ApplicationController < ActionController::Base
  include SessionsHelper

  #ログイン後
  private

    def require_login
      unless logged_in?
        redirect_to login_path
      end
    end
  
  #ログイン前
  private
    
    def before_login
      if logged_in?
        redirect_to posts_path
      end
    end
  
  private
    
    def admin_check
      if !current_user.admin 
        redirect_to root_path
      end
    end
end

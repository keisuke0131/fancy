class ApplicationController < ActionController::Base
  include SessionsHelper
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500

  def render_404
    render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  end

  def render_500
    render template: 'errors/error_500', status: 500, layout: 'application', content_type: 'text/html'
  end


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

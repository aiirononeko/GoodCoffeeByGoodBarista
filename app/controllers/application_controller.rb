class ApplicationController < ActionController::Base
  helper_method :current_owner
  
  private

  def current_owner
    @current_owner_user ||= Owner.find_by(id: session[:owner_id]) if session[:owner_id]
  end
end

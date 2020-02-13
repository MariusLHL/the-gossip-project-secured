class ApplicationController < ActionController::Base
  include SessionsControllerHelper
  
  def authenticate_user
    unless current_user
      @error = "Please log in"
      render new_sessions_controller_path
    end
  end
end

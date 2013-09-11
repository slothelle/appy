class ApplicationController < ActionController::Base
  protect_from_forgery
  include ApplicationHelper

  before_filter :require_login

  private
  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end
end

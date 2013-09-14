module ApplicationHelper
  private
  def require_login
    unless current_user
      redirect_to log_in_path
    end
  end
end

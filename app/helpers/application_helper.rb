module ApplicationHelper
  def current_user
    @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
  end

  def is_user?
    current_user.id == params[:id].to_i
  end

  def create_session
    session[:current_user_id] = @user.id
  end

  def end_session
    session[:current_user_id] = nil
  end

  def pretty_time(time)
    time.strftime("%m/%d/%Y at %l:%M %P (%Z)")
  end

  def meets_requirements(pattern)
    return true if pattern.abbreviations.length > 0 && pattern.images.length > 0
  end
end

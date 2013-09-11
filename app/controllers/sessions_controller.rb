class SessionsController < ApplicationController
  skip_before_filter :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      create_session
      redirect_to patterns_path
    elsif @user.nil?
      @errors = "An account with the email address #{params[:session][:email]} not found."
      render "new"
    else
      @errors = "Wrong password."
      render "new"
    end
  end

  def destroy
    end_session
    redirect_to root_path
  end
end
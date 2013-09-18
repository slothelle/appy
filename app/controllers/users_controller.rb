class UsersController < ApplicationController
  def new
    @user = User.new
    render layout: false
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      create_session
      redirect_to patterns_path
    else
      redirect_to root_path
    end
  end
end
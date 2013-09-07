class RowsController < ApplicationController
  def new
    @row = Row.new
    render layout: false
  end

  def create
    @row = Row.create(params[:row])
    redirect_to @row
  end

  def show
    @row = Row.find(params[:id])
    render layout: false
  end
end
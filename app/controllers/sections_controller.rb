class SectionsController < ApplicationController
  def new
    render layout: false
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])
    @section = Section.create(params[:section])
    redirect_to @section
  end

  def show
    @section = Section.find(params[:id])
    render layout: false
  end
end
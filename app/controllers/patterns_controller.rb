class PatternsController < ApplicationController
  def new
    @pattern = Pattern.new
    @section = Section.new
    @row = Row.new
  end

  def index
    @patterns = Pattern.all
  end

  def create
    @pattern = Pattern.create(params[:pattern])
    redirect_to @pattern
  end

  def edit
    @pattern = Pattern.find(params[:id])
  end

  def show
    @pattern = Pattern.find(params[:id])
    @sections = @pattern.sections
  end
end
class PatternsController < ApplicationController
  def new
    @pattern = Pattern.new
    @abbreviations = Abbreviation.all
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

  def update
    @pattern = Pattern.find(params[:id])
    @pattern.update_attributes(params[:pattern])
    redirect_to @pattern
  end

  def show
    @pattern = Pattern.find(params[:id])
    @sections = @pattern.sections
  end
end
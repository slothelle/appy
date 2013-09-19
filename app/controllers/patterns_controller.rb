class PatternsController < ApplicationController
  include AbbreviationHelper
  include PdfViewHelper
  include PatternViewHelper

  def new
    @pattern = Pattern.new
  end

  def index
    @patterns = Pattern.all
  end

  def create
    @pattern = Pattern.create(params[:pattern])
    redirect_to patterns_path
  end

  def edit
    @pattern = Pattern.find(params[:id])
  end

  def update
    @pattern = Pattern.find(params[:id])
    @pattern.update_attributes(params[:pattern])
    redirect_to patterns_path
  end
end
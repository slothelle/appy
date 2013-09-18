class AbbreviationsController < ApplicationController
  include AbbreviationHelper

  def new
    @pattern = Pattern.find(params[:pattern_id])
    @abbreviation = Abbreviation.new
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])

    abbrevs = combine_stitches_with_definitions(params[:stitches], params[:definitions])
    create_abbreviations(abbrevs, @pattern)

    flash[:notice] = "Abbreviations successfully added to #{@pattern.name}"
    redirect_to patterns_path
  end
end
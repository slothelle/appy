class AbbreviationsController < ApplicationController
  include AbbreviationHelper

  def new
    @pattern = Pattern.find(params[:pattern_id])
    @abbreviation = Abbreviation.new
  end

  def create
    @pattern = Pattern.find(params[:pattern_id])
    abbrevs = params[:stitches].values.zip(params[:definitions].values)
    abbrevs.each do |sts, defs|
      next if sts == "" || defs == ""
      Abbreviation.create(stitch: sts, definition: defs, pattern: @pattern)
    end
    flash[:notice] = "Abbreviations successfully added to #{@pattern.name}"
    redirect_to patterns_path
  end
end
require 'spec_helper'

describe AbbreviationsController do
  render_views

  context "#create" do
    it "should create a nested array of :stitches and :definitions"
    it "should create an Abbreviation for each nested array"
    it "should not create an Abbreviation if :stitches || :definitions == ''"
  end
end
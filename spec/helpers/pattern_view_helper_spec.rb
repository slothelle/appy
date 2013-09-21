require 'spec_helper'

describe PatternViewHelper do
  context "#pretty_time" do
    it "should return a long string for timestamps"
    it "should require one argument"
    it "should return an error if arg is a string"
  end

  context "#short_pretty_time" do
    it "should return mm/dd/yy for timestamps"
    it "should require one argument"
    it "should return an error if arg is a string"
  end

  context "#pattern_meets_pdf_requirements" do
    it "should require one argument"

    describe "images and abbrevs" do
      it "should return false if missing both"
      it "should return true if both are present"
      it "should return false if one is missing"
    end

    describe "charts and chart legends" do
      it "should return true if missing both"
      it "should return false if missing one"
      it "should return true if both are present"
    end
  end

  context "STATES" do
    it "should contain published"
    it "should contain testing"
    it "should contain editing"
    it "should contain draft"
  end
end
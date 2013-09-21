require 'spec_helper'

describe PatternViewHelper do
  context "#pretty_time" do
    it "should return a long string for timestamps" do
      date = DateTime.new(2013, 1, 12)
      expect(pretty_time(date)).to eq("01/12/2013 at 12:00 am (+00:00)")
    end

    it "should require one argument" do
      expect { pretty_time }.to raise_error(ArgumentError)
    end

    it "should return an error if arg is a string" do
      expect { pretty_time("1") }.to raise_error(NoMethodError)
    end
  end

  context "#short_pretty_time" do
    it "should return mm/dd/yy for timestamps" do
      date = DateTime.new(2013, 1, 12)
      expect(short_pretty_time(date)).to eq("01/12/2013")
    end

    it "should require one argument" do
      expect { short_pretty_time }.to raise_error(ArgumentError)
    end

    it "should return an error if arg is a string" do
      expect { short_pretty_time("1") }.to raise_error(NoMethodError)
    end
  end

  context "#pattern_meets_pdf_requirements" do
    it "should require one argument" do
      expect { pattern_meets_pdf_requirements? }.to raise_error(ArgumentError)
    end

    describe "images and abbrevs" do
      before do
        @pattern = FactoryGirl.create(:pattern)
      end

      it "should return false if missing both" do
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_false
      end

      it "should return true if both are present" do
        @pattern.images << FactoryGirl.create(:image)
        @pattern.abbreviations << FactoryGirl.create(:abbreviation)
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_true
      end

      it "should return false if one is missing" do
        @pattern.images << FactoryGirl.create(:image)
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_false
      end
    end

    describe "charts and chart legends" do
      before do
        @pattern = FactoryGirl.create(:pattern)
        @pattern.images << FactoryGirl.create(:image)
        @pattern.abbreviations << FactoryGirl.create(:abbreviation)
      end

      it "should return true if missing both" do
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_true
      end

      it "should return false if missing one" do
        @pattern.chart_legends << FactoryGirl.create(:chart_legend)
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_false
      end

      it "should return true if both are present" do
        @pattern.charts << FactoryGirl.create(:chart)
        @pattern.chart_legends << FactoryGirl.create(:chart_legend)
        expect(pattern_meets_pdf_requirements?(@pattern)).to be_true
      end
    end
  end

  context "STATES" do
    it "should contain published" do
      expect{
        STATES.include?("published")
      }.to be_true
    end

    it "should contain testing" do
      expect{
        STATES.include?("testing")
      }.to be_true
    end

    it "should contain editing" do
      expect{
        STATES.include?("editing")
      }.to be_true
    end

    it "should contain draft" do
      expect{
        STATES.include?("draft")
      }.to be_true
    end
  end
end
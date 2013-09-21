require 'spec_helper'

describe PdfViewHelper do
  context "#version" do
    it "should return Month YYYY from timestamp"
    it "should return an error if passed a string"
    it "should require one argument"
  end

  context '#format_rows_for' do
    it "should require one argument"
    it "should take an array as an argument"
    it "should return Row, Ins, Sts for rows with all 3"
    it "should return Row, Ins for rows without Sts"
    it "should return a nested array"
  end

  context '#render_legend' do
    # Will need to write a helper method for this
    # That can be used as a before do for all subsequent methods
    describe '#sort_legend_by_size' do
    end

    describe '#format_legend' do
    end

    describe '#format_short_legend' do
    end
  end
end
require 'spec_helper'

describe PdfViewHelper do
  context "#version" do
    it "should return Month YYYY from timestamp" do
      date = DateTime.new(2013, 1, 12)
      expect(version(date)).to eq("January 2013")
    end

    it "should return an error if passed a string" do
      expect { version("1") }.to raise_error(NoMethodError)
    end

    it "should require one argument" do
      expect { version }.to raise_error(ArgumentError)
    end
  end

  context '#format_rows_for' do
    before do
      @section = make_section_with_pattern
      5.times do
        @section.rows << make_row_with_section_pattern
      end
      @section.rows[0].stitch_count = ""
    end

    it "should require one argument" do
      expect { format_rows_for }.to raise_error(ArgumentError)
    end

    it "should return an error if passed a string" do
      expect { format_rows_for("1") }.to raise_error(NoMethodError)
    end

    it "should return Row, Ins, Sts for rows with all 3 (sts)" do
      rows = format_rows_for(@section)
      expect(rows.last.include?("(12 sts)")).to be_true
    end

    it "should return Row, Ins, Sts for rows with all 3 (length)" do
      rows = format_rows_for(@section)
      expect(rows.last.length == 3).to be_true
    end

    it "should return Row, Ins for rows without Sts" do
      rows = format_rows_for(@section)
      expect(rows[0].include?("sts")).to be_false
    end

    it "should return a nested array" do
      rows = format_rows_for(@section)
      expect(rows[0].is_a?(Array)).to be_true
    end
  end

  context '#render_legend' do
    # Will need to write a helper method for this
    # That can be used as a before do for all subsequent methods
    # Need to create more factories for different length abbrevs
    describe '#sort_legend_by_size' do
    end

    describe '#format_legend' do
    end

    describe '#format_short_legend' do
    end
  end
end
require 'spec_helper'

describe Pattern do
  it { should be_instance_of(Pattern) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:gauge) }
  it { should allow_mass_assignment_of(:yarn) }
  it { should allow_mass_assignment_of(:yarn_info) }
  it { should allow_mass_assignment_of(:needle) }
  it { should allow_mass_assignment_of(:finished_sizes) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:notions) }
  it { should allow_mass_assignment_of(:instructions) }
  it { should allow_mass_assignment_of(:version) }
  it { should allow_mass_assignment_of(:sections_attributes) }
  it { should allow_mass_assignment_of(:rows_attributes) }
  it { should allow_mass_assignment_of(:abbreviations_attributes) }
  it { should allow_mass_assignment_of(:version) }
  it { should allow_mass_assignment_of(:chart_legends_attributes) }
  it { should allow_mass_assignment_of(:state) }
  it { should allow_mass_assignment_of(:free) }
  it { should have_many(:rows) }
  it { should have_many(:sections) }
  it { should have_many(:images) }
  it { should have_many(:abbreviations) }
  it { should have_many(:charts) }
  it { should have_many(:chart_legends) }
  it { should have_many(:comments) }
  it { should accept_nested_attributes_for(:rows) }
  it { should accept_nested_attributes_for(:sections) }
  it { should accept_nested_attributes_for(:abbreviations) }
  it { should accept_nested_attributes_for(:charts) }
  it { should accept_nested_attributes_for(:chart_legends) }

  context "helpers" do
    describe "#images?" do
      it "should return true if pattern has images" do
        image = make_image_with_pattern
        pattern = image.pattern
        expect(pattern.images?).to be_true
      end

      it "should return false if pattern has no images" do
        pattern = make_pattern
        expect(pattern.images?).to be_false
      end
    end

    describe "#abbrevs?" do
      it "should return true if pattern has abbreviations" do
        abbrev = make_abbrev_with_pattern
        pattern = abbrev.pattern
        expect(pattern.abbrevs?).to be_true
      end

      it "should return false if pattern has no abbreviations" do
        pattern = make_pattern
        expect(pattern.abbrevs?).to be_false
      end
    end

    describe "#charts?" do
      it "should return true if pattern has charts" do
        chart = make_chart_with_pattern
        pattern = chart.pattern
        expect(pattern.charts?).to be_true
      end

      it "should return false if pattern has no charts" do
        pattern = make_pattern
        expect(pattern.charts?).to be_false
      end
    end

    describe "#chart_legends?" do
      it "should return true if pattern has chart legends" do
        chart_legend = make_chart_legend_with_pattern
        pattern = chart_legend.pattern
        expect(pattern.chart_legends?).to be_true
      end

      it "should return false if pattern has no chart legends" do
        pattern = make_pattern
        expect(pattern.chart_legends?).to be_false
      end
    end

    describe "#free?" do
      it "should return true if pattern is free" do
        pattern = make_pattern
        pattern.free = "1"
        expect(pattern.free?).to be_true
      end

      it "should return false if pattern is not free" do
        pattern = make_pattern
        expect(pattern.free?).to be_false
      end
    end

    describe "#comments?" do
      it "should return true if pattern has comments" do
        comment = make_comment_with_tester_pattern
        pattern = comment.pattern
        expect(pattern.comments?).to be_true
      end

      it "should return false if pattern has no comments" do
        pattern = make_pattern
        expect(pattern.comments?).to be_false
      end
    end
  end

  context "state helpers" do
    before do
      @pattern = make_pattern
    end

    describe "#testing?" do
      it "should return true if pattern state is testing" do
        @pattern.state = "testing"
        expect(@pattern.testing?).to be_true
      end

      it "should return false if pattern state is editing" do
        @pattern.state = "editing"
        expect(@pattern.testing?).to be_false
      end

      it "should return false if pattern state is draft" do
        @pattern.state = "draft"
        expect(@pattern.testing?).to be_false
      end
    end

    describe "#editing?" do
      it "should return true if pattern state is editing" do
        @pattern.state = "editing"
        expect(@pattern.editing?).to be_true
      end

      it "should return false if pattern state is testing" do
        @pattern.state = "testing"
        expect(@pattern.editing?).to be_false
      end

      it "should return false if pattern state is draft" do
        @pattern.state = "draft"
        expect(@pattern.editing?).to be_false
      end
    end

    describe "#draft?" do
      it "should return true if pattern state is draft" do
        @pattern.state = "draft"
        expect(@pattern.draft?).to be_true
      end

      it "should return false if pattern state is editing" do
        @pattern.state = "editing"
        expect(@pattern.draft?).to be_false
      end

      it "should return false if pattern state is testing" do
        @pattern.state = "testing"
        expect(@pattern.draft?).to be_false
      end
    end
  end
end
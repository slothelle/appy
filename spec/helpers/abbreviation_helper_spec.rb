require 'spec_helper'

describe AbbreviationHelper do
  context "#combine_stitches_with_definitions" do
    it "should take two arguments" do
      expect {
        combine_stitches_with_definitions({ taco: "1"})
        }.to raise_error(ArgumentError)
    end

    it "should create a nested array combining params" do
      sts = { taco: "k" }
      defs = { taco: "knit" }
      expect(combine_stitches_with_definitions(sts, defs)).to eq([["k", "knit"]])
      combine_stitches_with_definitions(sts, defs)
    end

    describe "with invalid args" do
      it "should return NoMethodError error if both args are strings" do
        expect {
          combine_stitches_with_definitions(
            "banana", "hello")
        }.to raise_error(NoMethodError)
      end

      it "should return NoMethodError if both args are arrays" do
        expect {
          combine_stitches_with_definitions(
            ["banana"], ["hello"])
        }.to raise_error(NoMethodError)
      end

      it "should return NoMethodError if one arg is a hash and the other is not" do
        expect {
          combine_stitches_with_definitions(
            ["banana"], {taco: "hello"})
        }.to raise_error(NoMethodError)
      end
    end
  end

  context "#create_abbreviations" do
    before do
      @pattern = make_pattern
    end

    it "should take two arguments" do
      expect {
        create_abbreviations
        }.to raise_error(ArgumentError)
    end

    it "should create an Abbreviation for each subarray" do
      expect {
        create_abbreviations([["taco", "polo"], ["ankle", "cheese"]], @pattern)
        }.to change(Abbreviation, :count).by(2)
    end

    it "should skip subarrays containing empty strings ('')" do
      expect {
        create_abbreviations([["taco", "polo"], ["", "cheese"]], @pattern)
        }.to change(Abbreviation, :count).by(1)
    end

    describe "with invalid inputs" do
      it "should not create an Abbreviation for a one-dimensional array" do
        expect {
        create_abbreviations(["taco", "polo"], @pattern)
        }.to change(Abbreviation, :count).by(0)
      end

      it "should return a NoMethodError for a string" do
        expect {
          ccreate_abbreviations("banana", "hello")
        }.to raise_error(NoMethodError)
      end
    end
  end
end
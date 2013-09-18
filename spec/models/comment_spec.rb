require 'spec_helper'

describe Comment do
  it { should be_instance_of(Comment) }
  it { should allow_mass_assignment_of(:user) }
  it { should allow_mass_assignment_of(:body) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should allow_mass_assignment_of(:confidence) }
  it { should allow_mass_assignment_of(:pattern_id) }
  it { should allow_mass_assignment_of(:user_id) }
  it { should allow_mass_assignment_of(:resolved) }
  it { should belong_to(:pattern) }
  it { should belong_to(:user) }

  context "helpers" do
    describe "#resolved?" do
      before do
        @comment = make_comment_with_tester_pattern
      end

      it "should return 'Yes' if resolved == 1" do
        @comment.resolved = "1"
        expect(@comment.resolved?).to eq("Yes")
      end

      it "should return 'Yes' if resolved contains any content ('poo')" do
        @comment.resolved = "poo"
        expect(@comment.resolved?).to eq("Yes")
      end

      it "should return 'No' if resolved is empty string" do
        @comment.resolved = ""
        expect(@comment.resolved?).to eq("No")
      end

      it "should return 'No' if resolved is nil" do
        @comment.resolved = nil
        expect(@comment.resolved?).to eq("No")
      end
    end
  end
end
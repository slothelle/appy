require 'spec_helper'

describe User do
  it { should be_instance_of(User) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:role) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:role) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("liz@liz.com").for(:email) }
  it { should allow_value("liz").for(:name) }
  it { should allow_value("liz").for(:password) }

  context "admin?" do
    it "should return true for admin user" do
      user = make_admin
      expect(user.admin?).to be_true
    end

    it "should return false for editor user" do
      user = make_editor
      expect(user.admin?).to be_false
    end

    it "should return false for tester user" do
      user = make_tester
      expect(user.admin?).to be_false
    end
  end

  context "editor?" do
    it "should return true for editor user" do
      user = make_editor
      expect(user.editor?).to be_true
    end

    it "should return true for admin user" do
      user = make_admin
      expect(user.editor?).to be_true
    end

    it "should return false for tester user" do
      user = make_tester
      expect(user.editor?).to be_false
    end

  end

  context "tester?" do
    it "should return true for tester user" do
      user = make_tester
      expect(user.tester?).to be_true
    end

    it "should return true for admin user" do
      user = make_admin
      expect(user.tester?).to be_true
    end

    it "should return false for editor user" do
      user = make_editor
      expect(user.tester?).to be_false
    end

  end
end
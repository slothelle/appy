require 'spec_helper'

describe User do
  it { should be_instance_of(User) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_presence_of(:name) }
  it { should_not allow_value("blah").for(:email) }
  it { should allow_value("liz@liz.com").for(:email) }
  it { should allow_value("liz").for(:name) }
  it { should allow_value("liz").for(:password) }

end
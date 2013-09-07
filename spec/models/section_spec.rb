require 'spec_helper'

describe Section do
  it { should be_instance_of(Section) }
  it { should allow_mass_assignment_of(:number) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should have_many(:rows) }
  it { should belong_to(:pattern) }
end
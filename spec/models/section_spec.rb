require 'spec_helper'

describe Section do
  it { should be_instance_of(Section) }
  it { should allow_mass_assignment_of(:number) }
  it { should allow_mass_assignment_of(:title) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should allow_mass_assignment_of(:pattern_id) }
  it { should allow_mass_assignment_of(:rows_attributes) }
  it { should allow_mass_assignment_of(:instructions) }
  it { should have_many(:rows) }
  it { should belong_to(:pattern) }
  it { should accept_nested_attributes_for(:rows) }
end
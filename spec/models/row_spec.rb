require 'spec_helper'

describe Row do
  it { should be_instance_of(Row) }
  it { should allow_mass_assignment_of(:num) }
  it { should allow_mass_assignment_of(:instructions) }
  it { should allow_mass_assignment_of(:side) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should allow_mass_assignment_of(:stitch_count) }
  it { should belong_to(:section) }
end
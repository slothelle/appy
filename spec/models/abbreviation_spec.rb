require 'spec_helper'

describe Abbreviation do
  it { should be_instance_of(Abbreviation) }
  it { should allow_mass_assignment_of(:stitch) }
  it { should allow_mass_assignment_of(:definition) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should belong_to(:pattern) }
  it { should validate_presence_of(:stitch) }
  it { should validate_presence_of(:pattern) }
  it { should validate_presence_of(:definition) }
end
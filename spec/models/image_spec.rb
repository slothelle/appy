require 'spec_helper'

describe Image do
  it { should be_instance_of(Image) }
  it { should allow_mass_assignment_of(:url) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should belong_to(:pattern) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:pattern) }
end
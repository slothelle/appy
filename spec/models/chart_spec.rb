require 'spec_helper'

describe Chart do
  it { should be_instance_of(Chart) }
  it { should allow_mass_assignment_of(:image) }
  it { should allow_mass_assignment_of(:image_file_name) }
  it { should allow_mass_assignment_of(:pattern) }
  it { should belong_to(:pattern) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:pattern) }
end
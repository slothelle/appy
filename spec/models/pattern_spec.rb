require 'spec_helper'

describe Pattern do
  it { should be_instance_of(Pattern) }
  it { should allow_mass_assignment_of(:name) }
  it { should allow_mass_assignment_of(:gauge) }
  it { should allow_mass_assignment_of(:yarn) }
  it { should allow_mass_assignment_of(:yarn_info) }
  it { should allow_mass_assignment_of(:needle) }
  it { should allow_mass_assignment_of(:finished_sizes) }
  it { should allow_mass_assignment_of(:description) }
  it { should allow_mass_assignment_of(:notions) }
  it { should allow_mass_assignment_of(:instructions) }
  it { should allow_mass_assignment_of(:sections_attributes) }
  it { should allow_mass_assignment_of(:rows_attributes) }
  it { should allow_mass_assignment_of(:abbreviations_attributes) }
  it { should have_many(:rows) }
  it { should have_many(:sections) }
  it { should have_many(:images) }
  it { should have_many(:abbreviations) }
  it { should have_many(:charts) }
  it { should accept_nested_attributes_for(:rows) }
  it { should accept_nested_attributes_for(:sections) }
  it { should accept_nested_attributes_for(:abbreviations) }
end
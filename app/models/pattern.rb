class Pattern < ActiveRecord::Base
  attr_accessible :name, :gauge, :yarn, :yarn_info, :needle, :notions, :description, :finished_sizes, :sections_attributes, :rows_attributes, :instructions

  has_many :sections
  has_many :rows, :through => :sections
  has_many :images

  accepts_nested_attributes_for :images
  accepts_nested_attributes_for :sections
  accepts_nested_attributes_for :rows
end

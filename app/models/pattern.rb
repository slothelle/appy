class Pattern < ActiveRecord::Base
  attr_accessible :name, :gauge, :yarn, :yarn_info, :needle, :notions, :description, :finished_sizes, :instructions, :sections_attributes, :rows_attributes, :abbreviations_attributes

  has_many :sections
  has_many :rows, :through => :sections
  has_many :images
  has_many :abbreviations

  accepts_nested_attributes_for :sections
  accepts_nested_attributes_for :rows
  accepts_nested_attributes_for :abbreviations
end

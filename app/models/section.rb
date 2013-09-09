class Section < ActiveRecord::Base
  attr_accessible :title, :number, :description, :pattern, :pattern_id, :rows_attributes, :instructions

  belongs_to :pattern
  has_many :rows

  accepts_nested_attributes_for :rows
  # Double check this validation
  # validate_presence_of_pattern_id :on => :update
end
class Section < ActiveRecord::Base
  attr_accessible :title, :number, :description, :pattern, :pattern_id, :rows_attributes, :instructions

  belongs_to :pattern
  has_many :rows

  accepts_nested_attributes_for :rows
end
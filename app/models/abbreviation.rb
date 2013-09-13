class Abbreviation < ActiveRecord::Base
  attr_accessible :pattern, :stitch, :definition

  belongs_to :pattern
  validates_presence_of :pattern, :stitch, :definition
end
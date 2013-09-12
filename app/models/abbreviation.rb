class Abbreviation < ActiveRecord::Base
  attr_accessible :pattern, :stitch, :definition

  belongs_to :pattern
end
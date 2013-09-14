class ChartLegend < ActiveRecord::Base
  attr_accessible :image, :pattern, :image_file_name

  belongs_to :pattern

  has_attached_file :image, :styles => { :large => "540x540", :medium => "260x260", :small => "130x130" }

  validates_presence_of :image, :pattern
end

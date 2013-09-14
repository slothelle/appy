class Chart < ActiveRecord::Base
  attr_accessible :image, :pattern, :image_file_name, :chart_legends_attributes

  belongs_to :pattern
  has_many :chart_legends

  has_attached_file :image, :styles => { :large => "540x540" }

  accepts_nested_attributes_for :chart_legends

  validates_presence_of :image, :pattern
end

class Image < ActiveRecord::Base
  attr_accessible :photo, :pattern, :photo_file_name

  belongs_to :pattern
  has_attached_file :photo, :styles => { :large => "540x540", :medium => "300x300>", :thumb => "100x100>" }

  validates_presence_of :photo
end

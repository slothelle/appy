class Image < ActiveRecord::Base
  attr_accessible :url, :pattern

  belongs_to :pattern

  validates_presence_of :url, :pattern
end

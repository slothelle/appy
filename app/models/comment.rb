class Comment < ActiveRecord::Base
  attr_accessible :pattern, :user, :body, :confidence

  belongs_to :pattern

  validates_presence_of :pattern, :user, :body
end
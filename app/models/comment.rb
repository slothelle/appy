class Comment < ActiveRecord::Base
  attr_accessible :pattern, :user, :body, :confidence, :pattern_id, :user_id

  belongs_to :pattern
end
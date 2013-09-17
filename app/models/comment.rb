class Comment < ActiveRecord::Base
  attr_accessible :pattern, :user, :body, :confidence, :pattern_id, :user_id, :resolved

  belongs_to :pattern
  belongs_to :user

  def resolved?
    return "Yes" if resolved != nil
    return "No"
  end
end
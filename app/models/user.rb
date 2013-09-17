class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :role

  has_many :comments

  has_secure_password

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  validates_uniqueness_of :email, :on => :create
  validates_presence_of :email, :password, :on => :create
  validates_presence_of :name, :role

  ROLES = %w[admin editor tester]

  def admin?
    return true if role == "admin"
  end

  def editor?
    return true if role == "editor"
  end

  def tester?
    return true if role == "tester"
  end
end
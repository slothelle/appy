class Pattern < ActiveRecord::Base
  attr_accessible :name, :gauge, :yarn, :yarn_info, :needle, :notions, :description, :finished_sizes, :instructions, :sections_attributes, :rows_attributes, :abbreviations_attributes, :version, :chart_legends_attributes, :state, :free, :re_release, :user_id, :target_date, :errata, :errata_fixed

  has_many :sections
  has_many :rows, :through => :sections
  has_many :images
  has_many :abbreviations
  has_many :charts
  has_many :chart_legends
  has_many :comments
  belongs_to :user

  accepts_nested_attributes_for :sections
  accepts_nested_attributes_for :rows
  accepts_nested_attributes_for :abbreviations
  accepts_nested_attributes_for :charts
  accepts_nested_attributes_for :chart_legends

  # Helpers for attributes
  def images?
    return true if images.length > 0
  end

  def abbrevs?
    return true if abbreviations.length > 0
  end

  def charts?
    return true if charts.length > 0
  end

  def chart_legends?
    return true if chart_legends.length > 0
  end

  def free?
    return true unless free == nil
  end

  def comments?
    return true if comments.length > 0
  end

  # States
  def testing?
    return true if state == "testing"
  end

  def editing?
    return true if state == "editing"
  end

  def draft?
    return true if state == "draft"
  end

  def has_errors?
    return true if errata && (errata_fixed == nil || errata_fixed == "")
  end
end

class Pattern < ActiveRecord::Base
  attr_accessible :name, :gauge, :yarn, :yarn_info, :needle, :notions, :description, :finished_sizes, :instructions, :sections_attributes, :rows_attributes, :abbreviations_attributes, :version, :chart_legends_attributes

  has_many :sections
  has_many :rows, :through => :sections
  has_many :images
  has_many :abbreviations
  has_many :charts
  has_many :chart_legends

  accepts_nested_attributes_for :sections
  accepts_nested_attributes_for :rows
  accepts_nested_attributes_for :abbreviations
  accepts_nested_attributes_for :charts
  accepts_nested_attributes_for :chart_legends

  def images?
    return true if images.length > 0
  end

  def abbrevs?
    return true if abbreviations.length > 0
  end

  def charts_with_legends?
    if charts.length > 0 && chart_legends.length > 0
      true
    end
  end
end

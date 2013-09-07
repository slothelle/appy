class Row < ActiveRecord::Base
  attr_accessible :num, :instructions, :side, :pattern

  belongs_to :section

  # Validate uniquess of row num on pattern id and section id
end

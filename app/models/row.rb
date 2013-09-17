class Row < ActiveRecord::Base
  attr_accessible :num, :instructions, :side, :pattern, :stitch_count

  belongs_to :section

  # Validate uniquess of row num on pattern id and section id
end

class UpdateSectionFields < ActiveRecord::Migration
  def change
    change_column(:sections, :description, :text)
    change_column(:sections, :instructions, :text)
  end
end

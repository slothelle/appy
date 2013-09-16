class AddColumnToRows < ActiveRecord::Migration
  def change
    add_column :rows, :stitch_count, :string
  end
end

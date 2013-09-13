class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.references :pattern
      t.string :image
      t.string :image_file_name
    end
  end
end

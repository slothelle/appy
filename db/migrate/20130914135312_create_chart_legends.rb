class CreateChartLegends < ActiveRecord::Migration
  def change
    create_table :chart_legends do |t|
      t.references :pattern
      t.string :image
      t.string :image_file_name
    end
  end
end

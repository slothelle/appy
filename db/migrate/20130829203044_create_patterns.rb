class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :gauge
      t.string :yarn
      t.string :yarn_info
      t.string :needle
      t.string :notions
      t.text :description
      t.string :finished_sizes
      t.timestamps
    end
  end
end

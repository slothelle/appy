class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.references :pattern
      t.string :number
      t.string :title
      t.string :description
      t.string :instructions
      t.timestamps
    end
  end
end

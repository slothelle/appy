class CreateRows < ActiveRecord::Migration
  def change
    create_table :rows do |t|
      t.string :num
      t.string :instructions
      t.string :side
      t.references :pattern
      t.references :section
      t.timestamps
    end
  end
end

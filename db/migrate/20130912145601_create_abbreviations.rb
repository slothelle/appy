class CreateAbbreviations < ActiveRecord::Migration
  def change
    create_table :abbreviations do |t|
      t.string :stitch
      t.string :definition
      t.timestamps
    end
  end
end

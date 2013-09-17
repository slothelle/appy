class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :pattern
      t.references :user
      t.text :body
      t.string :confidence
      t.timestamps
    end
  end
end

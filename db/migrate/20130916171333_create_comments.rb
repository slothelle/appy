class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :pattern
      t.references :user
      t.text :body
      t.string :confidence
    end
  end
end

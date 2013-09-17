class AddFieldToComments < ActiveRecord::Migration
  def change
    add_column :comments, :resolved, :string
  end
end

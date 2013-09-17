class ChangeTimestampsForComments < ActiveRecord::Migration
  def up
    change_column :comments, :created_at, :datetime, { null: false }
    change_column :comments, :updated_at, :datetime, { null: false }
  end
end

class AddStateToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :state, :string
  end
end

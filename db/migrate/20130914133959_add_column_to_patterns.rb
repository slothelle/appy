class AddColumnToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :version, :string
  end
end

class AddNewFieldsToPatterns < ActiveRecord::Migration
  def change
    add_column :patterns, :re_release, :string
    add_column :patterns, :user_id, :integer
    add_column :patterns, :target_date, :date
    add_column :patterns, :errata, :string
    add_column :patterns, :errata_fixed, :string
  end
end

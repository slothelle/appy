class AddColumnToPatternsAgain < ActiveRecord::Migration
  def change
    add_column :patterns, :free, :string
  end
end

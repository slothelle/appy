class RenameColumnImages < ActiveRecord::Migration
  def change
    rename_column(:images, :url, :photo)
  end
end

class UpdateRowFields < ActiveRecord::Migration
  def change
    change_column(:rows, :instructions, :text)
    remove_column(:rows, :side)
  end
end

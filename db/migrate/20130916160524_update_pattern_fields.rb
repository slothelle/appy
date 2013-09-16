class UpdatePatternFields < ActiveRecord::Migration
  def change
    change_column(:patterns, :yarn, :text)
    change_column(:patterns, :yarn_info, :text)
    change_column(:patterns, :needle, :text)
    change_column(:patterns, :notions, :text)
    change_column(:patterns, :finished_sizes, :text)
  end
end

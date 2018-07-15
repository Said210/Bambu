class AddColumnLevelToAccessLevel < ActiveRecord::Migration[5.2]
  def change
    add_column :access_levels, :level, :integer, options: {null: false}
  end
end

class AddColumnDetailToProjet < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :details, :text
  end
end

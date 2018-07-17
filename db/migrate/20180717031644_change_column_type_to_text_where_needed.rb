class ChangeColumnTypeToTextWhereNeeded < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :text, :text, null: false
    change_column :courses, :description, :text, null: false
    change_column :lectures, :introduction, :text, null: false
    change_column :questions, :details, :text, null: false
  end
end

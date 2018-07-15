class CreateLectures < ActiveRecord::Migration[5.2]
  def change
    create_table :lectures do |t|
      t.references :section, foreign_key: true, null: false
      t.string :name
      t.string :introduction
      t.timestamps
    end
  end
end

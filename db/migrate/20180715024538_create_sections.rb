class CreateSections < ActiveRecord::Migration[5.2]
  def change
    create_table :sections do |t|
      t.string :name, null: false
      t.references :course, foreign_key: true, null:false
      t.timestamps
    end
  end
end

class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.references :cover, foreign_key: {to_table: :photos}
      t.string :description

      t.timestamps
    end
  end
end

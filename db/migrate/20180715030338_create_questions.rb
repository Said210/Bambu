class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :details
      t.references :questionable, polymorphic: true, index: true
      t.timestamps
    end
  end
end

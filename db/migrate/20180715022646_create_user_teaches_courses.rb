class CreateUserTeachesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_teaches_courses do |t|
      t.references :teacher, foreign_key: { to_table: :users}, null: false
      t.references :taught_course, foreign_key: { to_table: :courses}, null: false
      t.index [:teacher_id, :taught_course_id], unique: true
      t.timestamps
    end
  end
end
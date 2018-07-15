class CreateUserTakesCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :user_takes_courses do |t|
      t.references :student, foreign_key: {to_table: :users}, null: false
      t.references :enroled_course, foreign_key: {to_table: :courses}, null: false
      t.index [:student_id, :enroled_course_id], unique: true
      t.index [:enroled_course_id, :student_id]
      t.timestamps
    end
  end
end

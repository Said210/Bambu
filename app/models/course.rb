class Course < ApplicationRecord
  ####### Course has students ###########
  has_many :enrollments, clas_name: 'UserTakesCourse', foreign_key: :enrolled_course_id, dependent: :destroy
  has_many :students, through: :enrollments, source: :student


  ##### Course is taught by teachers (lol)
  has_many :teachments, class_name: 'UserTeachesCourse', foreign_key: :taught_course_id, dependent: :destroy
  has_many :teachers, through: :teachments, source: :teacher

  has_many :sections
  has_many :lectures, through: :sections

  has_many :questions, as: :questionable
end

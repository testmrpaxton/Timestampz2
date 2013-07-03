# == Schema Information
#
# Table name: students
#
#  id               :integer          not null, primary key
#  name             :string(255)      not null
#  school           :string(255)      not null
#  grade            :string(255)      not null
#  homeroom_teacher :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Student < ActiveRecord::Base
  attr_accessible :grade, :homeroom_teacher, :first_name, :last_name, :school

  has_many :student_groups
  has_many :groups, through: :student_groups
  has_many :student_assignments
  has_many :assignments, through: :student_assignments
  has_many :student_day_classes
  has_many :day_classes, through: :student_day_classes

  scope :by_last_name, order("last_name")
end
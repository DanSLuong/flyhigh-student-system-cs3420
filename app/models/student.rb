class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  has_many :records, dependent: :destroy
  has_many :courses, through: :records

  accepts_nested_attributes_for :courses


  scope :undeclared_major, -> { where(major: "Undeclared") }
  scope :declared_major, -> { where.not(major: "Undeclared") }

  def find_student_record(course)
    records.find_by_course_id(course.id)
  end

  def show_gpa
    semester_gpa = gpa.to_s
    semester_gpa.present? ? semester_gpa : "pending"
  end


  def calculate_gpa
    credits = courses.pluck(:credit).sum
    score = 0.0
    student_records = records.where("course_id IN (?)", course_ids)
    student_records.pluck(:grade).each do |grade|
      score += grade_to_number grade
    end
    gpa = score / credits
    update(gpa: gpa)
  end

  private
  def grade_to_number grade
    score = 0.0
    case grade
    when "A"
      score =  4.0
    when "B"
      score =  3.0
    when "C"
      score =  2.0
    when "D"
      score =  1.0
    when "F"
      score = 0.0
    end
    score
  end
end

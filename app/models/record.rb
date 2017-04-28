class Record < ApplicationRecord
  belongs_to :student
  belongs_to :course


  def calculate_grade
    score = grading_algorithm
    grade = if score >= 90
              'A'
            elsif score < 90 && score >=80
              'B'
            elsif score < 80 && score >= 70
              'C'
            elsif score < 70 && score >= 60
              'D'
            else
              'F'
            end
    update(grade: grade)
  end

  private
  def grading_algorithm
    (quizzes + homeworks + (first_exam*2) + (second_exam*2) + (final*4)) / 10
  end
end

class Course < ApplicationRecord
  has_many :records
  has_many :students, through: :records

end

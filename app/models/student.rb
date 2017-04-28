class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :trackable, :validatable

  scope :undeclared_major, -> { where(major: "Undeclared") }
  scope :declared_major, -> { where.not(major: "Undeclared") }
end

class StudentsController < ApplicationController
  before_action :authenticate_student!

  def show
    @student = Student.find(current_student.id)
  end

  def edit
    @student = current_student
  end

  def update
    @student = Student.find(current_student.id)
    if @student.update_with_password(student_params)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@student)
      redirect_to @student
    else
      render "edit"
    end
  end

  def calculate_gpa
    current_student.calculate_gpa
    redirect_to student_path(current_student)
  end

  private
  def student_params
    params.require(:student).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :major, :address, :date_of_birth,:phone_number)
  end

end

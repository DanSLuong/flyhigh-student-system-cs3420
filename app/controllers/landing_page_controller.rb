class LandingPageController < ApplicationController
  def index
    if student_signed_in?
      redirect_to student_path(current_student)
    end
  end
end

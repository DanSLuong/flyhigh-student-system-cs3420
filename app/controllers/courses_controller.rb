class CoursesController < InheritedResources::Base
  before_action :authenticate_student!, only: [:show]

  private

    def course_params
      params.require(:course).permit(:subject, :number, :credit, :title, :description, :time, :days, :room, :instructor)
    end
end


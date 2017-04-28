ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Info" do
          para "Welcome to ActiveAdmin."
        end
      end

      column do
        panel "Recent Courses" do
          ul do
            Course.last(5).map do |course|
              li link_to course.title, admin_course_path(course)
            end
          end
        end
      end

      column do
        panel "Recent Students" do
          ul do
            Student.last(5).map do |student|
              li link_to student.email, admin_student_path(student)
            end
          end
        end
      end
    end
  end
end

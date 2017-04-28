ActiveAdmin.register Record do

  permit_params :student_id, :course_id, :first_exam, :second_exam, :final, :quizzes, :homeworks, :grade


  filter :student_email, as: :string
  preserve_default_filters!
  remove_filter :student

  form do |f|
    inputs "Student Record" do
      input :student_id, :as => :select, :collection => Student.all.map {|s| ["#{s.first_name} #{s.last_name} #{s.email}", s.id]}, :include_blank => false
      input :course_id, :as => :select, :collection => Course.all.map {|c| [c.title, c.id]}, :include_blank => false
      input :first_exam
      input :second_exam
      input :final
      input :quizzes
      input :homeworks
    end
    actions
  end

  controller do
    def scoped_collection
      super.includes :student, :course
    end
  end

  index do
    selectable_column
    id_column
    column "First Name", sortable: 'students.first_name' do |record|
      record.student.first_name
    end
    column "Last Name", sortable: 'students.last_name' do |record|
      record.student.last_name
    end
    column "Email", sortable: 'students.email' do |record|
      record.student.email
    end
    column "Course", sortable: 'courses.title' do |record|
      record.course.title
    end
    column :quizzes
    column :homeworks
    column :first_exam
    column :second_exam
    column :final
    column :grade
    column :created_at
    column :updated_at
    actions
  end

  show do
    panel "Student Record" do
      attributes_table_for record do
        row :id
        row "First Name" do
          record.student.first_name
        end
        row "Last Name" do
          record.student.last_name
        end
        row "Email" do
          link_to record.student.email, admin_student_path(record.student)
        end
        row "Course Title" do
          link_to record.course.title, admin_course_path(record.course)
        end
        row "Course Number" do
          record.course.number
        end
        row :quizzes
        row :homeworks
        row :first_exam
        row :second_exam
        row :final
        row :grade
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end

  action_item :calculate_grade, only: :show do
    link_to "Calculate Grade", calculate_grade_admin_record_path(record), method: :put
  end

  member_action :calculate_grade, method: :put do
    record = Record.find(params[:id])
    record.calculate_grade
    redirect_to admin_record_path(record)
  end
end

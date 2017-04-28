ActiveAdmin.register Student do

  permit_params :first_name, :last_name, :email, :password, :password_confirmation

  # eager load in students controller with associations
  # controller do
  #   def scoped_collection
  #     super.includes courses: :records
  #   end
  # end

  scope :all
  scope :undeclared_major
  scope :declared_major

  filter :first_name
  filter :last_name
  filter :date_of_birth
  filter :address
  filter :phone_number
  filter :major
  filter :email
  filter :gpa
  filter :current_sign_in_at
  filter :last_sign_in_at
  filter :created_at
  filter :updated_at

  form do |f|
    inputs "Student Details" do
      input :first_name
      input :last_name
      input :email
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    actions
  end

  index do
    selectable_column
    id_column
    column :first_name
    column :last_name
    column :date_of_birth
    column :address
    column :major
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :created_at
    column :updated_at
    actions
  end

  show do
    panel "Student Details" do
      attributes_table_for student do
        row :first_name
        row :last_name
        row :date_of_birth
        row :address
        row :email
        row :phone_number
        row :major
        row :gpa
      end
    end
    active_admin_comments
  end

  # sidebar "Courses Enrolled", only: :show do
  #     table_for student.courses do
  #       column :number
  #       column :title do |course|
  #         link_to course.title, admin_course_path(course)
  #       end
  #       column "Grade" do |course|
  #         grade = student.find_student_record(course).grade
  #         grade.present? ? grade : "pending"
  #       end
  #     end
  # end

  # sidebar "semester gpa", only: :show do
  #   student.show_gpa
  # end

  # action_item :calculate_gpa, only: :show do
  #   link_to "Calculate GPA", calculate_gpa_admin_student_path(student), method: :put
  # end


  # member_action :calculate_gpa, method: :put do
  #   student = Student.find(params[:id])
  #   student.calculate_gpa
  #   redirect_to admin_student_path(student)
  # end


end

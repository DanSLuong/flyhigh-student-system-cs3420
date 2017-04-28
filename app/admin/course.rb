ActiveAdmin.register Course do

  permit_params :subject, :number, :title, :time, :days, :room, :instructor, :credit, :description

  index do
    selectable_column
    id_column
    column :subject
    column :number
    column :credit
    column :title
    column :time
    column :days
    column :room
    column :instructor
    actions
  end


end

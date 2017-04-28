class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :subject
      t.string :number
      t.integer :credit
      t.string :title
      t.text :description
      t.string :time
      t.string :days
      t.string :room
      t.string :instructor

      t.timestamps
    end
  end
end

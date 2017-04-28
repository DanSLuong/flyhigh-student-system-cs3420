class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.references :student, foreign_key: true
      t.references :course, foreign_key: true
      t.integer :quizzes
      t.integer :homeworks
      t.integer :first_exam
      t.integer :second_exam
      t.integer :final
      t.string :grade

      t.timestamps
    end
  end
end

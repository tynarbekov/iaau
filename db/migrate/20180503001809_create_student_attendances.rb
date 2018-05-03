class CreateStudentAttendances < ActiveRecord::Migration[5.0]
  def change
    create_table :student_attendances do |t|
      t.references :schedule
      t.references :user

      t.timestamps
    end
  end
end

class CreateWorkExperiences < ActiveRecord::Migration[5.0]
  def change
    create_table :work_experiences do |t|
      t.string :place
      t.string :work_period
      t.string :position
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :place
      t.string :period
      t.string :faculty
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :startH
      t.integer :startM
      t.integer :endH
      t.integer :endM
      t.references :week
      t.references :subject
      t.references :location
      t.references :user
      t.references :group

      t.timestamps
    end
  end
end

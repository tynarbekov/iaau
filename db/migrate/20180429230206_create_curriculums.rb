class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :name
      t.string :period
      t.timestamps
    end
  end
end

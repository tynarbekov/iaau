class CreateSubjects < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects do |t|
      t.string :code
      t.string :name
      t.integer :credit
      t.integer :hours
      t.references :curriculum, foreign_key: true

      t.timestamps
    end
  end
end

class CreateSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :skills do |t|
      t.string :org_skill
      t.string :publication
      t.string :project
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

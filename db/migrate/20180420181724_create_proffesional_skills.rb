class CreateProffesionalSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :proffesional_skills do |t|
      t.references :skill_level, foreign_key: true
      t.references :proffesional_skill_list, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

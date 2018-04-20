class CreateComputerSkills < ActiveRecord::Migration[5.0]
  def change
    create_table :computer_skills do |t|
      t.references :user, foreign_key: true
      t.references :skill_level, foreign_key: true
      t.references :computer_skill_list, foreign_key: true

      t.timestamps
    end
  end
end

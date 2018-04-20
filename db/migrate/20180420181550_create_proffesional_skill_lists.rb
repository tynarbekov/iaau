class CreateProffesionalSkillLists < ActiveRecord::Migration[5.0]
  def change
    create_table :proffesional_skill_lists do |t|
      t.string :proff_skill

      t.timestamps
    end
  end
end

class CreateComputerSkillLists < ActiveRecord::Migration[5.0]
  def change
    create_table :computer_skill_lists do |t|
      t.string :comp_skill

      t.timestamps
    end
  end
end

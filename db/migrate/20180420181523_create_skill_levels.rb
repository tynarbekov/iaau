class CreateSkillLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :skill_levels do |t|
      t.string :level

      t.timestamps
    end
  end
end

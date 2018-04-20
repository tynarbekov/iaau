class ComputerSkill < ApplicationRecord
  belongs_to :user
  belongs_to :skill_level
  belongs_to :computer_skill_list
end

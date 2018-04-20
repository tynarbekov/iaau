class ProffesionalSkill < ApplicationRecord
  belongs_to :skill_level
  belongs_to :proffesional_skill_list
  belongs_to :user
end

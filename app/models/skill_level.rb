class SkillLevel < ApplicationRecord
  has_many :languages
  has_many :professional_skills
  has_many :computer_skills
end

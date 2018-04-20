class Language < ApplicationRecord
  belongs_to :user
  belongs_to :skill_level
end

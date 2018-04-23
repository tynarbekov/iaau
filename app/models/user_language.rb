class UserLanguage < ApplicationRecord
  belongs_to :language
  belongs_to :user
  belongs_to :skill_level
end

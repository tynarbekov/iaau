class Group < ApplicationRecord
  has_many  :users
  has_many :schedule
  belongs_to :user
end

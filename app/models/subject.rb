class Subject < ApplicationRecord
  belongs_to :curriculum
  has_many :schedule



end

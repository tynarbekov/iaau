class Schedule < ApplicationRecord
  belongs_to :week
  belongs_to :subject
  belongs_to :location
  belongs_to :user
  belongs_to :group
  has_many   :student_attendance

end

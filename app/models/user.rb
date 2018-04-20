class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable


  belongs_to :group
  belongs_to :user_role
  belongs_to :gender

  has_many   :computer_skills
  has_many   :professional_skills
  has_many   :educations
  has_many   :work_experiences



  devise :cas_authenticatable

end

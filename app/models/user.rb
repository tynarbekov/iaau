class User < ApplicationRecord
  before_validation :set_default_role
  devise :cas_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many   :computer_skills
  has_many   :proffesional_skills
  has_many   :educations
  has_many   :work_experiences
  has_many   :user_languages

  belongs_to :user_role
  # belongs_to :group
  # belongs_to :gender




# default role
  private
   def set_default_role
     puts "DEBUG: PROFILE ROLE SET"
     puts UserRole.find_by_name("student").id
     if self.user_role_id == nil
       self.user_role_id = UserRole.find_by_name("student").id
       # self.group_id = Group.find(1).id
       # self.gender_id = Gender.find(1).id
     end
    #  self.profile_role_id ||= ProfileRole.find_by_role('student').id
   end

end

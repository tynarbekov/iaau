class User < ApplicationRecord
  before_validation :set_default_role
  devise :cas_authenticatable

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, AvatarUploader

  has_many   :computer_skills
  has_many   :schedule

  has_many   :proffesional_skills
  has_many   :educations
  has_many   :work_experiences
  has_many   :user_languages
  has_one :group
  belongs_to :user_role
  # belongs_to :group
  # belongs_to :gender


  def teachers
    "#{name} #{surname} #{username} "
  end



# default role
  private

   def set_default_role
     if self.user_role_id == nil
       if self.username.length < 11 && self.username != "admin"
         self.user_role_id = UserRole.find_by_name("teacher").id
       elsif self.username == "admin"
         self.user_role_id = UserRole.find_by_name("admin").id
       else
         self.user_role_id = UserRole.find_by_name("student").id
         settingUser
       end
     end
   end

   def settingUser
         @user_password = Digest::SHA256.hexdigest("6852623452")
         uri = URI.join('https://ams.iaau.edu.kg/api/authentication/', "#{self.username}/", "#{@user_password}")

         http = Net::HTTP.new(uri.host, uri.port)
         http.use_ssl = (uri.scheme == 'https')
         response = http.send_request('POST',uri.request_uri)
         token1 = response.body
         puts response.code

         if response.code == "200"

           token1 = JSON.parse(token1)
           token = []

           token1.each do |key, value|
             token.push(value)
           end
           @token = token[0]

           url = URI("https://ams.iaau.edu.kg/api/v1/studentinfo")

           http = Net::HTTP.new(url.host, url.port)
           http.use_ssl = (uri.scheme == 'https')

           request = Net::HTTP::Get.new(url)
           request["bearer"] = token[0]

           response2 = http.request(request)
             if response2.code == "200"
               @body = JSON.parse(response2.body)
               self.name = @body["Name"]
               self.surname = @body["Surname"]
               self.phone = @body["Phone"]
               self.email = @body["Email"]
               self.address = @body["Enter year"]
               self.gender_id = Gender.find_by_name(@body["Gender"]).id
               # self.group_id = "mat"

               self.group_id = Group.find_by_name(@body["Group"]).id
               self.date_of_birth = @body["Birth Date"]
            end

           elsif response.code == "401"
             flash.now[:notice] = "You enter invalid ID or PASSWORD"
           else
             flash.now[:notice] = "Enter ID and PASSWORD"
           @err_msg = "Your password incorrect"

       end
   end


end

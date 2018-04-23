class HomeController < ApplicationController
  def index
    student = UserRole.find_by_name('student').id
    # if current_user.user_role_id = student
      # render 'user/'
    # end
    @user = current_user
  end
end

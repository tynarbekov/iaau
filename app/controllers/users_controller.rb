class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update, :destroy]

  def profile
    student = UserRole.find_by_name('student').id
    teacher = UserRole.find_by_name('teacher').id
    admin = UserRole.find_by_name('admin').id
    puts "STUDENT"
    puts student
    @user = current_user
    if current_user.user_role_id == student
      render 'student'
    elsif current_user.user_role_id == teacher
      render 'teacher'
    elsif current_user.user_role_id == admin
      render 'admin'
    end
  end


  def ams_data

      @ams_info = current_user.reset_password_token

      uri = URI.join('https://ams.iaau.edu.kg/api/authentication/', "#{current_user.username}/", "#{@ams_info}")
      puts uri


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
      puts token[0]
      request["bearer"] = token[0]
      response = http.request(request)

      @body = JSON.parse(response.body)
      # @for_ams.studend_body = JSON.parse(response.body)

      # @for_ams.studend_body.each do |key, value|
        # puts key, value
      # end

    elsif response.code == "401"
      flash.now[:notice] = "You enter invalid ID or PASSWORD"
    else
      flash.now[:notice] = "Enter ID and PASSWORD"
      @err_msg = "Your password incorrect"
    end
  end

  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to '/users/profile', notice: 'User was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        @user.reset_password_token = Digest::SHA256.hexdigest(@user.reset_password_token)
        if @user.save
          format.html { redirect_to user_users_profile_path(@user), notice: 'Profile was successfully updated.' }
        else
          format.html { redirect_to user_users_profile_path(@user), notice: 'Profile was successfully updated without ams data.' }
        end
        # format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
      respond_to do |format|
      format.html { redirect_to '/', notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit!
  end

end

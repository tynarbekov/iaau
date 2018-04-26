class UsersController < ApplicationController
  before_action :set_user, only: [:show,:edit, :update, :destroy]

  def profile
    student = UserRole.find_by_name('student').id
    teacher = UserRole.find_by_name('teacher').id
    admin = UserRole.find_by_name('admin').id
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


     http = Net::HTTP.new(uri.host, uri.port)
     http.use_ssl = (uri.scheme == 'https')
     response = http.send_request('POST',uri.request_uri)
     token1 = response.body

   if response.code == "200"

     token1 = JSON.parse(token1)
     token = []

     token1.each do |key, value|
       token.push(value)
     end
     @token = token[0]

     getYear = current_user.address.split('-')
     getYear = getYear[0].to_i
     getDiff = Time.current.year - getYear

     @studentGpa = []



     urlMarks = URI("https://ams.iaau.edu.kg/api/v1/marks/all")

     http = Net::HTTP.new(urlMarks.host, urlMarks.port)
     http.use_ssl = (uri.scheme == 'https')

     requestMarks = Net::HTTP::Get.new(urlMarks)
     requestMarks["bearer"] = token[0]
     responseMarks = http.request(requestMarks)

     if responseMarks.code == "200"
       @marks = JSON.parse(responseMarks.body)

     else
       @marks = []
     end

     for i in 1.. getDiff

       urlFall = URI("https://ams.iaau.edu.kg/api/v1/marks/#{getYear.to_s}-#{(getYear+1).to_s}/fall")

       @nowTime = Time.new

       if i <= getDiff && 1 <= @nowTime.month
         puts "YES IS BIGGER"
         urlSpring = URI("https://ams.iaau.edu.kg/api/v1/marks/#{getYear}-#{getYear+1}/spring")
       else
         urlSpring = URI("https://ams.iaau.edu.kg/api/v1/marks/#{getYear}-#{getYear+1}/sring")
       end


       getYear += 1

       httpFall = Net::HTTP.new(urlFall.host, urlFall.port)
       httpSpring = Net::HTTP.new(urlSpring.host, urlSpring.port)

       http.use_ssl = (uri.scheme == 'https')

       requestFall = Net::HTTP::Get.new(urlFall)
       requestSpring = Net::HTTP::Get.new(urlSpring)

       requestFall["bearer"] = token[0]
       requestSpring["bearer"] = token[0]

       responseFall = http.request(requestFall)
       responseSpring = http.request(requestSpring)

       if responseFall.code == "200"
         @studentGpa.push(JSON.parse(responseFall.body))
         if responseSpring.code == "200"
           @studentGpa.push(JSON.parse(responseSpring.body))
         end
       else
         @body = []
         puts "Invalid URL"
         flash.now[:notice] = "You enter invalid ID or PASSWORD"
       end # inner IF
     end #For Loop
     @totalGpa = []

     for i in 0... @studentGpa.length
       @sum = 0
       @count = 0
       @studentGpa[i].each do |s|
         s[1].each do |a|
           f = (a["Final"].to_i * 60)/100
           m = (a["Midterm"].to_i * 40)/100
           @sum += f + m
           @count += 1
         end
         @totalGpa.push(@sum/@count)
       end
     end
     puts @totalGpa
   else
     flash.now[:notice] = "You enter invalid ID or PASSWORD"
   end#main IF

    # Create Chart
      chart(@totalGpa)

  end #def


  def chart(arr)
    @chart = Fusioncharts::Chart.new({
         width: "1000",
         height: "400",
         type: "mscolumn2d",
         renderAt: "chartContainer",
         dataSource: {
             chart: {
             caption: "Chart your Grades by Semester",
             subCaption: "",
             xAxisname: "Semesters",
             yAxisName: "Range",
             theme: "fint",
             formatNumber: "0",
             exportEnabled: "1",
             scaleRecursively: "100",
             numberScaleUnit: "%",
             numberScaleValue: "1"
             },
             categories: [{
                     category: [
                         { label: "Semester 1" },
                         { label: "Semester 2" },
                         { label: "Semester 3" },
                         { label: "Semester 4" },
                         { label: "Semester 5" },
                         { label: "Semester 6" },
                         { label: "Semester 7" },
                         { label: "Semester 8" },
                     ]
                 }],
                 dataset: [
                     {
                         data: [
                             { value: "#{arr[0]}" },
                             { value: "#{arr[1]}" },
                             { value: "#{arr[2]}" },
                             { value: "#{arr[3]}" },
                             { value: "#{arr[4]}" },
                             { value: "#{arr[5]}" },
                             { value: "#{arr[6]}" },
                             { value: "#{arr[7]}" },
                         ]
                     }
               ]
         }

     })#End chart
     return @chart
  end


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

class UsersController < ApplicationController
  before_action :set_user, only: [:ams_data,:show,:edit, :update, :destroy]

  def profile
    student = UserRole.find_by_name('student').id
    teacher = UserRole.find_by_name('teacher').id
    admin = UserRole.find_by_name('admin').id
    @user = current_user
    if current_user.user_role_id == student
      @work_experience = WorkExperience.where(user_id: @user.id)
      @proff_skill = ProffesionalSkill.where(user_id: @user.id)
      @comp_skill = ComputerSkill.where(user_id: @user.id)
      @education = Education.where(user_id: @user.id)
      @skills = Skill.where(user_id: @user.id)
      @languages = UserLanguage.where(user_id: @user.id)
      render 'student'
    elsif current_user.user_role_id == teacher
      @gId = Group.where(user_id: current_user.id)
      @schedule = StudentAttendance.all
      @attendance = []

      @schedule.each do |s|
        if s.schedule.user.username == current_user.username
          @attendance.push(s)
        end
      end
      @attendance.sort_by(&:created_at)
      @attDays = []
      @attendance.each do |s|
        if @attDays.length <=0
          @attDays.push(s.created_at.to_date)
        end
        if @attDays.include? s.created_at.to_date
        else
          @attDays.push(s.created_at.to_date)
        end
      end
      @subList = []
      @attendance.each do |s|
        if @subList.length <=0
          @subList.push(s.schedule.subject.name)
        end
        if @subList.include? s.schedule.subject.name

        else
          @subList.push(s.schedule.subject.name)
        end
      end

      @userIds = []
      @schedule.each do |s|
        @userIds.push  s.schedule.user_id
      end

      # @counter = []
      # for i in 0...@userIds
      #   if  StudentAttendance.where(schedule.user_id: @userIds[i)]
      #
      #   end
      # end

      @students = User.where(user_role_id: UserRole.find_by_name('student').id,group_id: @gId )
      render 'teacher'



    elsif current_user.user_role_id == admin
      @teachers = User.where(user_role_id: UserRole.find_by_name('teacher').id)
      @students = User.where(user_role_id: UserRole.find_by_name('student').id )
      @level = SkillLevel.all.map { |level| [level.level] }
      @level.unshift('#')
      @groups = Group.all()
      render 'admin'
    end
  end


  def search
    name = params[:name].capitalize
    level = params[:level]
    skill = params[:skill]
    comp = params[:comp]
    skill = skill.split.map(&:capitalize).join(',')
    skill = skill.split(",")

    comp = comp.split.map(&:capitalize).join(',')
    comp = comp.split(",")

    if level != "#"
      lId = SkillLevel.where(level: level)
    end

    if name.length > 0 && comp.length <= 0
      @result = User.where(name: name)
    elsif skill.length > 0
      pIds = ProffesionalSkillList.where(proff_skill: skill)
      pIds = pIds.map{|p| p.id}
      if lId != nil
        uIds = ProffesionalSkill.where(proffesional_skill_list_id: pIds, skill_level_id: lId[0].id )
      else
        uIds = ProffesionalSkill.where(proffesional_skill_list_id: pIds )
      end
      uIds = uIds.map{|p| p.user_id}
      @result = User.where(id: uIds )
    elsif comp.length > 0 && skill.length <= 0
      puts "COMP"
      puts comp
      pIds = ComputerSkillList.where(comp_skill: comp)
      pIds = pIds.map{|p| p.id}
      puts "PIDS"
      puts pIds
      if lId != nil
        uIds = ComputerSkill.where(computer_skill_list_id: pIds, skill_level_id: lId[0].id )
      else
        uIds = ComputerSkill.where(computer_skill_list_id: pIds )
      end
      uIds = uIds.map{|p| p.user_id}
      puts "IDS"
      puts uIds
      @result = User.where(id: uIds )
    else
      @result = "Incorrect Search"
    end
  end


  def ams_data
    @ams_info = @user.reset_password_token

     uri = URI.join('https://ams.iaau.edu.kg/api/authentication/', "#{@user.username}/", "#{@ams_info}")


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

     getYear = @user.address.split('-')
     getYear = getYear[0].to_i
     getDiff = Time.current.year - getYear

     @studentGpa = []
     @fall = []
     @spring = []
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
         if i <= getDiff && 1 <= @nowTime.month && @nowTime.month <= 8
           urlSpring = URI("https://ams.iaau.edu.kg/api/v1/marks/#{getYear}-#{getYear+1}/spring")
         else
           urlSpring = URI("https://ams.iaau.edu.kg/api/v1/marks/#{getYear}-#{getYear+1}/spring")
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
           @fall.push(JSON.parse(responseFall.body))
           if responseSpring.code == "200"
             @spring.push(JSON.parse(responseSpring.body))
             @studentGpa.push(JSON.parse(responseSpring.body))
           end
         else
           @body = []
           puts "Invalid URL"
           flash.now[:notice] = "You enter invalid ID or PASSWORD"
         end # inner IF
       end #For Loop

       if i == getDiff
         if 1 <= @nowTime.month && @nowTime.month < 8
           compare(@spring,"spring")
         elsif @nowTime.month > 8 && @nowTime.month < 13
           compare(@spring,"fall")
         end
       end

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
     # Create Chart
     chart(@totalGpa)
     personalSchedule(@studentGpa[-1])
   else
     flash.now[:notice] = "You enter invalid ID or PASSWORD"
   end#main IF
  end #def

  def compare(data,period)
    puts period
    @failSub = []
    @passSub = []
    for i in 0...data.length
      data[i].each do |d|
        d[1].each do |a|
          puts a['Subject']
          sum = 0
          sum = ((a['Midterm'].to_i * 40)/100) + ((a['Final'].to_i * 60)/100)
          if sum < 50 || a['Final'].to_i < 50
            @failSub.push(a['Subject'])
          else
            @passSub.push(a['Subject'])
          end
        end
      end
    end


    @passSub.each do |s|
      @failSub.each do |f|
        if s.split.join(" ") == f
          @failSub.delete(f)
        end
      end
    end



    @cIds = Curriculum.where(period: period)
    @curriculumSub = Subject.where(curriculum_id: @cIds)

    @notTake = []
    for i in 0...@curriculumSub.length
      for j in 0...@passSub.length
        if @curriculumSub[i].name != @passSub[j].split.join(" ")
          # puts @curriculumSub[i].name
          if (@notTake.include? @curriculumSub[i].name) == false
            @notTake.push(@curriculumSub[i].name)
          else
            puts "SSSSS"
          end
        end
      end
    end

  end


  def personalSchedule(arr)
    @schedules = Schedule.all
    @amsSl = []
    @weeks = Week.all
    @monday = []

    @resultSchedule = []
      arr.each do |s|
        s[1].each do |a|
          @amsSl.push(a['Subject'])
        end
      end

    for i in 0...@schedules.length
      for j in 0...@amsSl.length
        if @schedules[i].subject.name == @amsSl[j].split.join(" ")
          @resultSchedule.push(@schedules[i])
        end
      end
    end

    @resultSchedule = @resultSchedule.sort_by{ |s| s.startH }

    @weeks.each do |s|
      @resultSchedule.each do |r|
        if s.name == r.week.name
          @monday.push(r)
        end
      end
    end

  end

  def chart(arr)
    @chart = Fusioncharts::Chart.new({
         width: "1000",
         height: "400",
         type: "mscolumn2d",
         renderAt: "chartContainer",
         dataSource: {
             chart: {
             caption: "#{@user.name} #{@user.surname}'s Grades by Semester",
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
    @work_experience = WorkExperience.where(user_id: @user.id)
    @proff_skill = ProffesionalSkill.where(user_id: @user.id)
    @comp_skill = ComputerSkill.where(user_id: @user.id)
    @education = Education.where(user_id: @user.id)
    @skills = Skill.where(user_id: @user.id)
    @languages = UserLanguage.where(user_id: @user.id)
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

  def getPdf
    @user = current_user
    respond_to do |format|
      format.html
      format.json
      format.pdf { render template: 'users/cv',pdf: 'cv' }
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

class V1::ApiController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  # protect_from_forgery prepend: true, with: :exception
  # before_action :authenticate_user!
  before_action :check_for_auth!, except: [:getStudentId]
  respond_to :json

  def createLanguage
    url = '/users/' + current_user.id.to_s + '/user_languages'
    if UserLanguage.create(user_id: current_user.id,language_id: params[:language],skill_level_id: params[:skillLevel])
      redirect_to url
    else
      redirect_to url
    end

  end

  def createEducation
    url = '/users/' + current_user.id.to_s + '/educations'
    if Education.create(user_id: current_user.id,place:params[:place],period:params[:period],faculty:params[:faculty])
      redirect_to url
    else
      redirect_to url
    end
  end

  def createWorkExperience
    url = '/users/' + current_user.id.to_s + '/work_experiences'
    if WorkExperience.create(user_id: current_user.id,place:params[:place],work_period:params[:work_period],position:params[:position])
      redirect_to url
    else
      redirect_to url
    end
  end

  def createComputerSkill
    url = '/users/' + current_user.id.to_s + '/computer_skills'
    if ComputerSkill.create(user_id: current_user.id, skill_level_id:params[:skill_level_id], computer_skill_list_id:params[:computer_skill_list_id])
      redirect_to url
    else
      redirect_to url
    end
  end

  def createProffesionalSkill
    url = '/users/' + current_user.id.to_s + '/proffesional_skills'
    if ProffesionalSkill.create(user_id: current_user.id, skill_level_id:params[:skill_level_id], proffesional_skill_list_id:params[:proffesional_skill_list_id])
      redirect_to url
    else
      redirect_to url
    end
  end

  def createSubject
    url = '/users/' + current_user.id.to_s + '/curriculums'
    if Subject.create(curriculum_id: params[:curriculum_id],code:params[:code],name: params[:name],credit: params[:credit], hours: params[:hours])
      redirect_to url
    else
      redirect_to url
    end
  end

  def getAllLanguages
    user_id = current_user.id
    userToLang = UserLanguage.where(user_id: user_id)
    arr = []
    userToLang.each do |element|
      arr.push(element.language_id)
    end

    languages = Language.where(id: arr)

    data = {:userData => languages}

    respond_to do |format|
      format.json { render :json => data }
    end
  end

  def getStudentId
      if User.exists?(username: params[:studentId])
        labSchedule(params[:studentId],params[:LabId])
      else
        data = {answer: "You are not PROGRAMMER" }
        render json: data
      end
  end

  private


  def labSchedule(studentId,labId)
    @nowDate =  Date.today.strftime("%A")
    @week = Week.where(name: @nowDate)
    @lab = Location.where(name: labId)

    @nowTime = DateTime.now.strftime("%H:%M")
    @editTIme = @nowTime.split(":")
    @editTIme.each.map { |c| Integer(c) }
    @a = @editTIme.join("")
    @a = @a.to_s
    if @a[0] == '0'
      @a.slice!(0)
    end
    puts "SSSS"
    puts @a
    @schedule = Schedule.where(location_id: @lab[0].id,week_id: @week[0].id)

    @sSt = @schedule[0].startH
    @sEt = @schedule[0].startM

    @all = @sSt.to_s + @sEt.to_s
    puts @all
    @eSt = @schedule[0].endH
    @eSm = @schedule[0].endM
    @end = @eSt.to_s + @eSm.to_s

    @user = User.where(username: studentId)

    if @end.to_i > @a.to_i  && @a.to_i > @all.to_i
        if @sTl = StudentAttendance.where(user_id:@user[0].id, schedule_id: @schedule[0].id)
          puts "YOU ARE ALLREADY COME THIS LESSON"
        else
          if @uToA = StudentAttendance.create(user_id:@user[0].id, schedule_id: @schedule[0].id )
            puts "Schedule CREATED"

          end
        end

    end

  end

  # def labSchedule(studentId,labId)
  #   lId = 1
  #   tuesday = []
  #   subject1 = {
  #     name: 'CS-100',
  #     sH: 8,
  #     sM: 30,
  #     eH: 10,
  #     eM: 00,
  #     labId: nil
  #   }
  #   subject2 = {
  #     name: 'CS-101',
  #     sH: 10,
  #     sM: 10,
  #     eH: 11,
  #     eM: 30,
  #     labId: 1
  #   }
  #
  #   tuesday.push(subject1,subject1)
  #
  #   # @nowDate =  Date.today.strftime("%A")
  #   # puts @nowDate
  #
  # end

















end

class V1::ApiController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  # protect_from_forgery prepend: true, with: :exception
  # before_action :authenticate_user!
  before_action :check_for_auth!
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

  def search
    # searchBy = params[:searchBy]
    # searchValue = params[:searchValue]
    #
    # if searchBy == 'name'
    #   @result = User.find_by_name(searchValue)
    #   render json: @result
    # elsif searchBy == 'lang'
    #   searchValue = searchValue.capitalize
    #   proff_skill = ProffesionalSkillList.where(proff_skill: searchValue)
    #   puts proff_skill.proff_skill
    #   @result =ProffesionalSkill.where(proffesional_skill_list_id: proff_skill.to_i)
    #   render json: @result
    # elsif searchBy == 'comp'
    #   render json: searchBy
    # else
    #   render json: "error"
    # end
    #
  end

















end

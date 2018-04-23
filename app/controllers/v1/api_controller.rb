class V1::ApiController < ApplicationController
  # skip_before_filter :verify_authenticity_token
  # protect_from_forgery prepend: true, with: :exception
  # before_action :authenticate_user!
  before_action :check_for_auth!
  respond_to :json

  def createLanguage
    lang = UserLanguage.create(user_id: current_user.id,language_id: params[:language],skill_level_id: params[:skillLevel])
    url = '/users/' + current_user.id.to_s + '/languages/index'

    redirect_to url

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

end

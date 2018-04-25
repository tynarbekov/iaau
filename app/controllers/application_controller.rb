require 'uri'
require 'net/http'
require 'digest'
require 'json'
class ApplicationController < ActionController::Base

  # protect_from_forgery prepend: true
  # protect_from_forgery with: :null_session

  # protect_from_forgery with: :exception
  # protect_from_forgery with: :exception, prepend: true
  # before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def check_for_auth!

    if user_signed_in?
      return true
    else
      render json:{
        status: 401,
        message: "You not Authorization"
      }
      return false
    end
  end


  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end
end
# class LanguagesController < ApplicationController
#   def index
#     @languages = current_user.user_languages.all
#
#     @languagesList = Language.all
#     @skillLevel = SkillLevel.all
#   end
#
#   def edit
#     @language = current_user.user_languages.find(params[:id])
#     @languagesList = Language.all
#     @skillLevel = SkillLevel.all
#   end
#
#   def update
#     url = '/users/' + current_user.id.to_s + '/languages/index'
#     puts "IN UPDATE"
#     if @language.update
#       format.html { redirect_to url, notice: 'Language was successfully updated.' }
#     else
#       format.html { render :edit }
#     end
#   end
#
# end

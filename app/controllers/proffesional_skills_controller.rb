class ProffesionalSkillsController < ApplicationController
  before_action :set_proffesional_skill, only: [:show, :edit, :update, :destroy]

  # GET /proffesional_skills
  # GET /proffesional_skills.json
  def index
    @proffesional_skills = current_user.proffesional_skills.all
    @proffesionalSkillList = ProffesionalSkillList.all
    @skillLevel = SkillLevel.all
  end

  # GET /proffesional_skills/1
  # GET /proffesional_skills/1.json
  def show
  end

  # GET /proffesional_skills/new
  def new
    @proffesional_skill = ProffesionalSkill.new
  end

  # GET /proffesional_skills/1/edit
  def edit
  end

  # POST /proffesional_skills
  # POST /proffesional_skills.json
  def create
    @proffesional_skill = ProffesionalSkill.new(proffesional_skill_params)

    respond_to do |format|
      if @proffesional_skill.save
        format.html { redirect_to @proffesional_skill, notice: 'Proffesional skill was successfully created.' }
        format.json { render :show, status: :created, location: @proffesional_skill }
      else
        format.html { render :new }
        format.json { render json: @proffesional_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /proffesional_skills/1
  # PATCH/PUT /proffesional_skills/1.json
  def update
    respond_to do |format|
      if @proffesional_skill.update(proffesional_skill_params)
        format.html { redirect_to user_proffesional_skills_path, notice: 'Proffesional skill was successfully updated.' }
        format.json { render :show, status: :ok, location: @proffesional_skill }
      else
        format.html { render :edit }
        format.json { render json: @proffesional_skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /proffesional_skills/1
  # DELETE /proffesional_skills/1.json
  def destroy
    @proffesional_skill.destroy
    respond_to do |format|
      format.html { redirect_to user_proffesional_skills_path(current_user), notice: 'Proffesional skill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proffesional_skill
      @proffesional_skill = ProffesionalSkill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def proffesional_skill_params
      params.require(:proffesional_skill).permit!
    end
end

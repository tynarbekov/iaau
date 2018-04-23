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
        format.html { redirect_to user_users_profile_path(@user), notice: 'Profile was successfully updated.' }
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

class User::ProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:new, :create]

  # GET /user/profiles/1
  # GET /user/profiles/1.json
  def show
  end

  # GET /user/profiles/new
  def new
    @user_profile = @user.build_profile
    @jobs = @user_profile.jobs
    @skills = @user_profile.skills
  end

  # GET /user/profiles/1/edit
  def edit
  end

  # POST /user/profiles
  # POST /user/profiles.json
  def create
    @user_profile = @user.build_profile(user_profile_params)

    respond_to do |format|
      if @user_profile.save
        if request.xhr?
          format.json { render json: {user_id: @user.id, user_profile: user_profile_params } }
        else
          format.html { redirect_to @user_profile, notice: 'Profile was successfully created.' }
          format.json { render json: user_profile_params }
        end
      else
        format.html { render action: 'new' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/profiles/1
  # PATCH/PUT /user/profiles/1.json
  def update
    @user.profile.destroy
    @user_profile = @user.build_profile
    respond_to do |format|
      if @user_profile.update(user_profile_params)
        if request.xhr?
          format.json { render json: {user_id: @user.id, user_profile: user_profile_params } }
        else
          format.html { redirect_to @user_profile, notice: 'Profile was successfully updated.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/profiles/1
  # DELETE /user/profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profile_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user = User.find(params[:user_id])
      @user_profile = @user.profile
    end

    def set_user
      if params[:user_id] = "new_user"
        @user = DummyUser.create!
      else
        @user = User.find(params[:user_id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:title, :email, :address, :summary, 
                                           :career_objectives,
                                           :first_name, :middle_names, :last_name, 
                                           :date_of_birth, :email_address, :website, 
                                           :landline_phone, :mobile_phone, :description, 
                                           :education, :work_history, :personal,
                                           qualifications_attributes:[:id, :title, :grade, :institute],
                                           jobs_attributes: [:id, :employer, :address, 
                                                             :address_id, :start_date, 
                                                             :end_date, :title, 
                                                             :employer_description, :description,
                                                             skills_attributes:[:id, :title, :description, :skill_id, :key_skill]],
                                           skills_attributes:[:id, :title, :description, :skill_id, :key_skill]
                                          )
    end
    
end

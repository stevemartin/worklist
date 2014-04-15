class CvsController < ApplicationController
  def show
    @cv = User::Profile.find_by_url( params[:url] )
    if @cv
      respond_to do |format|
        if request.xhr?
          format.json { render :json => Api::V1::WorklistPresenter.new(@cv).attributes(:array) }
        else
          format.html { render }
        end
      end
    else
      render :no_worklist
    end
  end

  def update
    @cv = User::Profile.find_by_url( params[:url] )

    respond_to do |format|
      if @cv.update(cv_params) && valid_url_key(@cv, cv_params)
        if request.xhr?
          format.json { render json: { user_profile: cv_params } }
        end
      else
        format.html { render action: 'edit' }
        format.json { render json: @cv.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cv = User::Profile.find_by_url_and_url_key( params[:url], params[:url_key] )
    respond_to do |format|
      if @cv && @cv.destroy
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false } }
      end
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cv_params
      params.require(:user_profile).permit(:id, :url, :url_key, :title, :email, :address, :summary,
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

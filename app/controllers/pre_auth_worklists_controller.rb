class PreAuthWorklistsController < ApplicationController
  before_action :set_worklist, only: [:show, :edit, :update, :destroy]
  respond_to :json

  def show
    respond_to do |format|
        format.json { render :json => {worklist: WorklistPresenter.new(@worklist).attributes(:array) } }
    end
  end

  def new
    @worklist = Worklist.new
  end

  def create
    @worklist = Worklist.new(worklist_params)

    respond_to do |format|
      if @worklist.save
        cookies[:url] = {value: @worklist.url, expires: 30.days.from_now }
        cookies[:url_key] = {value: @worklist.url_key, expires: 30.days.from_now }

        format.json { render :json => {worklist: WorklistPresenter.new(@worklist).attributes(:array) } }
      else
        format.json { render json: @worklist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @worklist.update(worklist_params)
        format.json { render :json => {worklist: WorklistPresenter.new(@worklist).attributes(:array) } }
      else
        format.json { render json: @worklist.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worklist
      set_worklist_from_signature
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worklist_params
      params.require(:worklist).permit(:id, :title, :email, :address, :summary, :url, :url_key,
                                           :career_objectives,
                                           :first_name, :middle_names, :last_name,
                                           :date_of_birth, :email_address, :website,
                                           :landline_phone, :mobile_phone, :description,
                                           :education, :work_history, :personal, :_destroy,
                                           qualifications_attributes:[:id, :title, :grade, :institute, :_destroy],
                                           jobs_attributes: [:id, :employer, :address,
                                                             :address_id, :start_date,
                                                             :end_date, :title,
                                                             :employer_description, :description, :_destroy,
                                                             skills_attributes:[:id, :title, :description, :skill_id, :key_skill, :_destroy]],
                                           skills_attributes:[:id, :title, :description, :skill_id, :key_skill, :_destroy]
                                          )
    end
end

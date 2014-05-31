class WorklistsController < ApplicationController
  before_action :set_worklist, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => :url

  def url
    if @worklist = Worklist.find_by_url(params[:url])
      respond_to do |format|
          format.json { render :json => { worklist: WorklistPresenter.new(@worklist).attributes(:array) } }
          format.html { render :url }
          format.pdf { render :pdf => :url, :layout => 'pdf_application' }
      end
    else
      render 'no_worklist'
    end
  end

  def show_current_user
    respond_to do |format|
      format.json { render json: current_user.to_json }
    end
  end

  def link_worklist
    set_worklist_from_signature
    Rails.logger.info("Linking worklist #{@worklist.id} to user #{current_user.id}")
    if @worklist
      @worklist.user = current_user
      @worklist.save!
    end
    Rails.logger.info("Linked worklist #{@worklist.id} to user #{current_user.id}")
    respond_to do |format|
      format.json { render json: { success: true } }
    end
  end

  # GET /worklists/1
  # GET /worklists/1.json
  def show
    respond_to do |format|
        format.json { render :json => {worklist: WorklistPresenter.new(@worklist).attributes(:array) } }
    end
  end

  # GET /worklists/new
  def new
    @worklist = Worklist.new
  end

  # GET /worklists/1/edit
  def edit
  end

  # POST /worklists
  # POST /worklists.json
  def create
    @worklist = Worklist.new(worklist_params)

    respond_to do |format|
      if @worklist.save
        format.json { render :json => {worklist: WorklistPresenter.new(@worklist).attributes(:array), status: :created } }
      else
        format.json { render json: @worklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worklists/1
  # PATCH/PUT /worklists/1.json
  def update
    Rails.logger.info(params)
    respond_to do |format|
      if @worklist.update(worklist_params)
        format.json { render :json => { worklist: WorklistPresenter.new(@worklist).attributes(:array), status: :updated } }
      else
        format.json { render json: @worklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worklists/1
  # DELETE /worklists/1.json
  def destroy
    respond_to do |format|
      if @worklist && @worklist.destroy
        format.json { render json: { success: true } }
      else
        format.json { render json: { success: false } }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worklist
      Rails.logger.info("Setting worklist for User: #{current_user.id}")
      if @worklist = current_user.worklist
      else
        @worklist = Worklist.new( t('home')[:worklist] )
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worklist_params
      params.require(:worklist).permit(:id, :title, :email, :address, :summary, :url, :url_key,
                                           :career_objectives,
                                           :first_name, :middle_names, :last_name,
                                           :date_of_birth, :email_address, :website,
                                           :landline_phone, :mobile_phone, :description,
                                           :education, :work_history, :personal,
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

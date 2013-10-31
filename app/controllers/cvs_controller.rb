class CvsController < ApplicationController
  def show
    @cv = User::Profile.find_by_url( params[:url] )
    respond_to do |format|
      if request.xhr?
        format.json { render :json => Api::V1::WorklistPresenter.new(@cv) }
      else
        format.html { render }
      end
    end
  end
end

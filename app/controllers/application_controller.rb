class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :html, :json

  def set_worklist_from_signature
    unless @worklist = Worklist.find_by_url_and_url_key(params[:url], params[:url_key])
      respond_to do |format|
        format.json { render json: {error:'Invalid URL Signature - Worklist Not Found'}, status: :not_found  }
      end
    end
  end
end

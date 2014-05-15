class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  respond_to :html, :json

  protect_from_forgery with: :exception
  after_filter :set_csrf_cookie_for_ng

  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end

  def set_worklist_from_signature
    @worklist = Worklist.find_by_url_and_url_key(params[:url].to_s, params[:url_key])
    if !@worklist || @worklist.user_id.present?
      respond_to do |format|
        format.json { render json: {error:'Invalid URL Signature - Worklist not found or already owned'}, status: :not_found  }
      end
    end
  end

  protected
  def verified_request?
    super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
  end

end

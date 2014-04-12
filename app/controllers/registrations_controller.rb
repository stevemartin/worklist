class RegistrationsController < Devise::RegistrationsController

  after_filter  :set_csrf_cookie_for_ng

  # extract csrf handling into a module
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
    p "XSRF: #{cookies['XSRF-TOKEN']}"
  end

  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        if request.xhr?
          respond_with(resource) do |format|
            format.json { render }
          end
        else
          respond_with resource, :location => after_sign_up_path_for(resource)
          set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        end
      else
        expire_session_data_after_sign_in!

        if request.xhr?
          respond_with(resource) do |format|
            format.json { render }
          end
        else
          respond_with resource, :location => after_inactive_sign_up_path_for(resource)
        end
      end
    else
      if request.xhr?
        respond_to do |format|
          format.json { render json: {errors:resource.errors }, status: :unprocessable_entity }
          # format.js { render js: {errors:resource.errors, status: :unprocessable_entity } }
        end
      else
        clean_up_passwords resource
        respond_with resource
      end
    end
  end

  protected

  def verified_request?
    p "Request XSRF: #{ request.headers['X_XSRF_TOKEN'] }"
    p "Form auth token: #{ form_authenticity_token }"
    super || form_authenticity_token == request.headers['X_XSRF_TOKEN']
  end

  def after_update_path_for(resource)
    if resource.responds_to? :has_profile? && resource.has_profile?
      user_path(resource)
    else
      new_user_profile_path(resource)
    end
  end
end

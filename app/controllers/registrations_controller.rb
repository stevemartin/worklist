class RegistrationsController < Devise::RegistrationsController

  protected

    def after_update_path_for(resource)
      if resource.responds_to? :has_profile? && resource.has_profile?
        user_path(resource)
      else
        new_user_profile_path(resource)
      end
    end
end

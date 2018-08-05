class RegistrationsController < Devise::RegistrationsController

  protected

  def after_update_path_for(resource)
    flash["notice"] = "Your account has been updated successfully."
    profile_path(resource)
  end

 def after_new_user_registration_path_for(resource)
   flash["notice"] = "Your account has been created successfully."
   profile_path(resource)
 end
end

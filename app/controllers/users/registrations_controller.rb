class Users::RegistrationsController < Devise::RegistrationsController
  
  protected

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  def update_resource(resource, params)
    # Require current password if user is trying to change password.
    return super if params["password"]&.present?

    # Allows user to update registration information without password.
    resource.update_without_password(params.except("current_password"))
  end
end
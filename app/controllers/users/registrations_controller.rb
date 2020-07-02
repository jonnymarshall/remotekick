class Users::RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    params.delete :current_password
    resource.update_without_password(params)
  end

end
class Users::ConfirmationsController < Devise::ConfirmationsController
  private

  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource)
    root_path
  end

    def after_confirmation_path_for(resource_name, resource)
      token = resource.send(:set_reset_password_token)
      edit_password_path(resource, reset_password_token: token)
    end
end
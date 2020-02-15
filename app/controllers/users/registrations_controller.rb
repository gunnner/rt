class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def show; end

  protected

  def configure_sign_up_params
    keys = %i[first_name last_name username image]
    devise_parameter_sanitizer.permit(:sign_up, keys: keys)
  end

  def configure_account_update_params
    keys = %i[first_name last_name username image]
    devise_parameter_sanitizer.permit(:account_update, keys: keys)
  end
end

class RegistrationsController < Devise::RegistrationsController

  #Redefining these methods to use Log In form in Cats pages
  helper_method :resource_name, :resource, :devise_mapping

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
  #End of Devise methods

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :email, :password, :password_confirmation, :photo, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache)
  end
end

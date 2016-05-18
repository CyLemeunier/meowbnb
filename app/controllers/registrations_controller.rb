class RegistrationsController < Devise::RegistrationsController

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :email, :password, :password_confirmation, :photo, :photo, :photo_cache)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :address, :city, :email, :password, :password_confirmation, :current_password, :photo, :photo_cache)
  end
end

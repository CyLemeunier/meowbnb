class UsersController < ApplicationController

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
   def update
    # Devise use update_with_password instead of update_attributes.
    # This is the only change we make.
    if resource.update_attributes(params[resource_name])
      set_flash_message :notice, :updated
      # Line below required if using Devise >= 1.2.0
      sign_in resource_name, resource, :bypass => true
      redirect_to after_update_path_for(resource)
    else
      clean_up_passwords(resource)
      redirect_to after_update_path_for(resource), :flash => { :alert => "Error message" }
    end
  end

  def show
    @user = User.find(params[:id])
  end
end

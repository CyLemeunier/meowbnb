class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home


  #Redefining these methods to use Log In form in Pages pages
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

  def home
  end
end

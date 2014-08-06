class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # before_action :configure_permitted_parameters, if: :devise_controller?

  

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :email, :phone, :walker, :avatar, :avatar_cache, :remove_avatar]
    devise_parameter_sanitizer.for(:account_update) << [:name, :email, :phone, :walker, :avatar, :avatar_cache, :remove_avatar]
  end
end

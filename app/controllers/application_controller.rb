class ApplicationController < ActionController::Base
  before_action :authenticate_user!, only: [:new,:edit]
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resourse)
    photos_path
  end
  def after_sign_out_path_for(resourse)
    root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

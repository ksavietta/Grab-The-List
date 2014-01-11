class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :except => ["home#index"]

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name]
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_sign_in_path_for(resource)
    if current_user.groups == []
      new_group_path
    else
      groups_path
    end
  end



  def authorize_user
    unless user_signed_in? and current_user.is_admin?
        raise ActionController::RoutingError.new('Not Found')
      end
    end
end

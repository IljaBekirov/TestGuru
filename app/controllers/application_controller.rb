# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(current_user)
    flash[:notice] = "Привет, #{current_user.first_name}"
    current_user.is_a?(Admin) ? admin_tests_path : root_path
  end

  private

  def configure_permitted_parameters
    allow_params = %i[name email password password_confirmation first_name last_name type]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(allow_params) }
  end
end

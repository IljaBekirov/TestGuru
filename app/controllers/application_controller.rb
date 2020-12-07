# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def after_sign_in_path_for(current_user)
    flash[:notice] = t('.hello', first_name: current_user.first_name)
    current_user.admin? ? admin_tests_path : root_path
  end

  def default_url_options
    I18n.locale == I18n.default_locale ? {} : { lang: I18n.locale }
  end

  private

  def configure_permitted_parameters
    allow_params = %i[name email password password_confirmation first_name last_name type]
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(allow_params) }
  end

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end
end

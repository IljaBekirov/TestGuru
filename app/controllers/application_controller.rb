# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?,
                :exit

  private

  def authenticate_user!
    cookies[:from_url] = request.original_url
    redirect_to login_path, alert: 'Введите правильный логин и пароль' unless current_user

    cookies[:email] = current_user&.email
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end

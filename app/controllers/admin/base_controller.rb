# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'Вы не авторизованы для просмотра данной страницы.' unless current_user.is_a?(Admin)
  end
end

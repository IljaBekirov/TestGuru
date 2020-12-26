# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @badges_check = current_user.badges
  end
end

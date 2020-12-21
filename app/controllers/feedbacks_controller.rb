# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def new; end

  def create
    @feedback = feedback_params
    render new_feedback_path, alert: t('.failure') && return unless @feedback

    @feedback[:current_user] = current_user
    FeedbacksMailer.feedback_sended(@feedback).deliver_now
    redirect_to root_path, notice: t('.success')
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :message)
  end
end

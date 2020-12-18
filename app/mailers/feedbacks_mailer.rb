# frozen_string_literal: true

class FeedbacksMailer < ApplicationMailer
  ADMIN_EMAIL = 'ilja.bekirov@gmail.com'

  def feedback_sended(feedback)
    @user = feedback[:current_user]
    @title = feedback[:title]
    @message = feedback[:message]

    mail to: ADMIN_EMAIL, subject: @title.to_s
  end
end

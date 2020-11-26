# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :answer_count_max

  scope :correct_answers, -> { where(correct: true) }

  private

  def answer_count_max
    return if (1..4).include?(question.answers.count)

    errors.add(:base, message: 'One Question can have from 1 to 4 answers')
  end
end

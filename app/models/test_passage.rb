# frozen_string_literal: true

class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_and_belongs_to_many :badges, dependent: :destroy

  SUCCESSFUL = 85

  before_validation :before_validation_set_first_question, on: :create

  scope :pass, -> { where('pass = ?', true) }

  def pass_status!
    self.pass = true if successful?
    save
  end

  def successful?
    result_percent >= SUCCESSFUL
  end

  def result_percent
    (correct_questions * 100.0 / self.test.questions.count).round(2)
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    self.current_question = next_question
    save!
  end

  def completed?
    current_question.nil?
  end

  def number_question
    test.questions.order(:id).where('id < ?', current_question.id).size + 1
  end

  private

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?

    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end

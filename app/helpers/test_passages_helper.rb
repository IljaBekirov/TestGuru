# frozen_string_literal: true

module TestPassagesHelper
  def progress_percent(number_question, questions_count)
    (number_question - 1) * 100 / questions_count
  end
end

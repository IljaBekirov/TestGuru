# frozen_string_literal: true

module AnswersHelper
  def answer_header(answer)
    if answer.new_record?
      '<h1>Создание нового Ответа для</h1>'.html_safe
    else
      '<h1>Редактирование Вопроса</h1>'.html_safe
    end
  end
end

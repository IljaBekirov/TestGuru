# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "<h1>Создание нового Вопроса для #{@test.title}</h1>".html_safe
    else
      "<h1>Редактирование Вопроса #{question.test.title}</h1>".html_safe
    end
  end
end

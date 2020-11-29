# frozen_string_literal: true

module TestsHelper
  def find_category(category_id)
    Category.find(category_id).title
  end

  def test_level(level)
    case level
    when 0 then :easy
    when 1 then :medium
    when 2 then :hard
    when 3 then :very_hard
    else :other
    end
  end

  def test_header(test)
    if test.new_record?
      "<h1>Создание нового Теста</h1>".html_safe
    else
      "<h1>Редактирование Теста '#{@test.title}'</h1>".html_safe
    end
  end
end

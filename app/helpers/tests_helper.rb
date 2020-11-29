# frozen_string_literal: true

module TestsHelper
  TEST_LEVEL = { '0' => :easy, '1' => :medium, '2' => :hard, '3' => :very_hard }.freeze

  def find_category(category_id)
    Category.find(category_id).title
  end

  def test_level(level)
    return TEST_LEVEL[level.to_s] if (0..3).include?(level)

    :other
  end

  def test_header(test)
    if test.new_record?
      '<h1>Создание нового Теста</h1>'.html_safe
    else
      "<h1>Редактирование Теста '#{@test.title}'</h1>".html_safe
    end
  end
end

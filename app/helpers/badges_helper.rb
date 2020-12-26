# frozen_string_literal: true

module BadgesHelper
  def find_style(badge)
    if badge.new_record?
      first_attempt_style = 'display: none'
      all_categories_style = 'display: none'
      all_level_style = 'display: none'
    elsif badge.rule_type == 'first_attempt'
      first_attempt_style = 'display: block'
      all_categories_style = 'display: none'
      all_level_style = 'display: none'
    elsif badge.rule_type == 'all_categories'
      first_attempt_style = 'display: none'
      all_categories_style = 'display: block'
      all_level_style = 'display: none'
    elsif badge.rule_type == 'all_level'
      first_attempt_style = 'display: none'
      all_categories_style = 'display: none'
      all_level_style = 'display: block'
    end
    {
      first_attempt: first_attempt_style,
      all_categories: all_categories_style,
      all_level: all_level_style
    }
  end

  def find_condition(badge)
    case badge.rule_type
    when 'all_categories' then Category.find(badge.condition).title
    when 'all_level' then level(badge.condition)
    else
      badge.condition
    end
  end

  def level(level)
    return TestsHelper::TEST_LEVEL[level.to_s] if (0..3).include?(level.to_i)

    :other
  end
end

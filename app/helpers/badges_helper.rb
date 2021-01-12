# frozen_string_literal: true

module BadgesHelper
  def find_style(badge)
    if badge.new_record?
      all_types('display: none', 'display: none', 'display: none')
    else
      badge_rule_type(badge)
    end
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

  private

  def all_types(first_attempt_style, all_categories_style, all_level_style)
    { first_attempt: first_attempt_style, all_categories: all_categories_style, all_level: all_level_style }
  end

  def badge_rule_type(badge)
    case badge.rule_type
    when 'first_attempt'
      first_attempt_style = 'display: block'
      all_categories_style = 'display: none'
      all_level_style = 'display: none'
    when 'all_categories'
      first_attempt_style = 'display: none'
      all_categories_style = 'display: block'
      all_level_style = 'display: none'
    when 'all_level'
      first_attempt_style = 'display: none'
      all_categories_style = 'display: none'
      all_level_style = 'display: block'
    else
      first_attempt_style = 'display: none'
      all_categories_style = 'display: none'
      all_level_style = 'display: none'
    end

    all_types(first_attempt_style, all_categories_style, all_level_style)
  end
end

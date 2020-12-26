# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  has_and_belongs_to_many :test_passages, depend: :destroy

  BADGES = {
    first_attempt: { desc: 'Прохождение теста с n-ой попытки' },
    all_categories: { desc: 'Все тесты категории', sel: Category.all.map { |a| [a.title, a.id] } },
    all_level: { desc: 'Все тесты уровня', sel: Test.all.map { |a| [a.level, a.level] }.uniq }
  }.freeze
end

# frozen_string_literal: true

class Badge < ApplicationRecord
  has_and_belongs_to_many :users, depend: :destroy
  has_and_belongs_to_many :test_passages, depend: :destroy

  def self.all_type_badges
    {
      first_attempt: { desc: 'Прохождение теста с n-ой попытки' },
      all_categories: { desc: 'Все тесты категории' },
      all_level: { desc: 'Все тесты уровня' }
    }
  end

  def self.all_categories
    Category.all.map { |category| [category.title, category.id] }
  end

  def self.all_level
    Test.all.map { |test| [test.level, test.level] }.uniq
  end
end

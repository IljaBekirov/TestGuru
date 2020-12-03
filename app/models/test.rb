# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_many :test_passages
  has_many :users, through: :test_passages
  belongs_to :category, optional: true
  belongs_to :author, class_name: 'User', foreign_key: 'user_id', optional: true

  validates :title, presence: true
  validates :level, presence: true, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level, message: 'Should uniq level and title' }

  scope :easy_level, -> { where(level: 0..1) }
  scope :medium_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :category_fo_test, ->(category_title) { joins(:category).where('categories.title = ?', category_title) }

  def self.test(category)
    category_fo_test(category).order(title: :desc).pluck(:title)
  end
end

# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :questions
  has_and_belongs_to_many :users
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  def self.test(category)
    joins(:category).where('categories.title = ?', category).order(title: :desc).pluck(:title)
  end
end

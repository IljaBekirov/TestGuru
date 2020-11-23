# frozen_string_literal: true

class Test < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :category

  def self.test(category)
    joins(:category).where("categories.title = ?", category).order(title: :desc).pluck(:title)
  end
end

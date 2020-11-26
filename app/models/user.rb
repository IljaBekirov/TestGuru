# frozen_string_literal: true

class User < ApplicationRecord
  has_and_belongs_to_many :tests
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :name, presence: true

  def tests_list(level)
    tests.where(level: level)
  end
end

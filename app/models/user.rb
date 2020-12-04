# frozen_string_literal: true

require 'digest/sha2'

class User < ApplicationRecord
  EMAIL_VALID = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_many :test_passages
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: 'user_id'

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_VALID }

  has_secure_password

  def tests_list(level)
    tests.where(level: level)
  end

  def test_passage(test)
    test_passages.order(created_at: :desc).find_by(test_id: test.id)
  end
end

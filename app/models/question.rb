# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_one :answer
end

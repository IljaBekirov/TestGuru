# frozen_string_literal: true

class AddIndexToTest < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, %i[level title], unique: true
  end
end

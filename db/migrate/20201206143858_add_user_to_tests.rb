# frozen_string_literal: true

class AddUserToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :user, foreign_key: true # , null: false
  end
end

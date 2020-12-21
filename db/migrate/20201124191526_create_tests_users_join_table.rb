# frozen_string_literal: true

class CreateTestsUsersJoinTable < ActiveRecord::Migration[6.0]
  def up
    create_table :users_tests do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
    end
  end
end

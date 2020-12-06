# frozen_string_literal: true

class DeleteNameFromUsers < ActiveRecord::Migration[6.0]
  def up
    remove_column :users, :name, if_exists: true
  end
end

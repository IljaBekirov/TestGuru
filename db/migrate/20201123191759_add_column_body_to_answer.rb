# frozen_string_literal: true

class AddColumnBodyToAnswer < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :body, :string
  end
end

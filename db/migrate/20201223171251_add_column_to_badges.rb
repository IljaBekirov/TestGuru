# frozen_string_literal: true

class AddColumnToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :rule_type, :string, null: false, default: 'other'
  end
end

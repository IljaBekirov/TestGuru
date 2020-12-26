# frozen_string_literal: true

class AddColumnConditionsToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :condition, :string
  end
end

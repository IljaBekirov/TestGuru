# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_name, null: false
      t.string :rule_type, null: false, default: 'other'
      t.string :condition

      t.timestamps
    end
  end
end

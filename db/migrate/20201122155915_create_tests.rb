class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :title
      t.integer :level, null: false
      t.references :category, null: false, foreign_ket: true

      t.timestamps
    end
  end
end

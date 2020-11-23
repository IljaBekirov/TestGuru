class ChangeTestsColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :category_id, :integer
    add_foreign_key :tests, :categories
  end
end

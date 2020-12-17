class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :tests, :category_id
  end
end

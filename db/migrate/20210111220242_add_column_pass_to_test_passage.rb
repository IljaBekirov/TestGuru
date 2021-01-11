class AddColumnPassToTestPassage < ActiveRecord::Migration[6.0]
  def change
    add_column :test_passages, :pass, :boolean, default: false
  end
end

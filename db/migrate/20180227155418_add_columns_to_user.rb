class AddColumnsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :bio, :text
    add_column :users, :picture, :string
  end
end

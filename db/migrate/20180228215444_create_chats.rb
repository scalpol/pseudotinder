class CreateChats < ActiveRecord::Migration[5.1]
  def change
    create_table :chats do |t|
      t.references :user, foreign_key: true
      t.references :match, foreign_key: true
      t.string :message

      t.timestamps
    end
  end
end

class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.references :user, foreign_key: true
      t.integer :choosed
      t.boolean :like

      t.timestamps
    end
  end
end

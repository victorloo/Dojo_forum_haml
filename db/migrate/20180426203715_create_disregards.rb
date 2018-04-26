class CreateDisregards < ActiveRecord::Migration[5.1]
  def change
    create_table :disregards do |t|
      t.integer :user_id
      t.integer :nobody_id

      t.timestamps
    end
  end
end

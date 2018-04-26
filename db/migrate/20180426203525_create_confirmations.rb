class CreateConfirmations < ActiveRecord::Migration[5.1]
  def change
    create_table :confirmations do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end

class CreateApplyings < ActiveRecord::Migration[5.1]
  def change
    create_table :applyings do |t|
      t.integer :user_id
      t.integer :target_id

      t.timestamps
    end
  end
end

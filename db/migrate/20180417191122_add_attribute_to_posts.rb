class AddAttributeToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :privacy, :string
  end
end

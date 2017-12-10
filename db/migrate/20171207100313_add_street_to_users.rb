class AddStreetToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :street, :text
  end
end

class AddColumsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :studentid, :string
    add_column :users, :fos, :string
    add_column :users, :gender, :string
    add_column :users, :ph, :string
  end
end

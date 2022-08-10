class AddNameToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :intro, :text
  end
end

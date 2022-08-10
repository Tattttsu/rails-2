class ChangeDataUserToImage < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :image, :string
  end
end

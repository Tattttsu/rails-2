class ChangeDataRoomToImage < ActiveRecord::Migration[6.1]
  def change
    change_column :rooms, :image, :string
  end
end

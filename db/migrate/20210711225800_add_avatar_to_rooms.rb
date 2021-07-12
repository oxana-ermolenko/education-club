class AddAvatarToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :avatar, :string
  end
end

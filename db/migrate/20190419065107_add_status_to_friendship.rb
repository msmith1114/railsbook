class AddStatusToFriendship < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :status, :string, default: "Pending"
  end
end

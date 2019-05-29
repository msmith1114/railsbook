class AddProfileDataToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :occupation, :string
    add_column :users, :location, :string
    add_column :users, :bio, :text
    add_column :users, :marital_status, :integer
  end
end

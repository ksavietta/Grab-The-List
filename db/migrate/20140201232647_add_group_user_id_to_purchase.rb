class AddGroupUserIdToPurchase < ActiveRecord::Migration
  def change
    add_column :purchases, :group_user_id, :integer
  end
end
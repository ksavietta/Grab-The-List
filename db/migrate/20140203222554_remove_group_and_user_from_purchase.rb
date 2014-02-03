class RemoveGroupAndUserFromPurchase < ActiveRecord::Migration
  def up
    change_column :purchases, :group_user_id, :integer, :null => false
    remove_column :purchases, :user_id
    remove_column :purchases, :group_id
  end

  def down
    change_column :purchases, :group_user_id, :integer, null:true
    add_column :purchases, :user_id, :integer, null:false
    add_column :purchases, :group_id, :integer, null:false
  end
end

class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.decimal :cost, :precision => 8, :scale => 2
      t.timestamp :purchased_at, null:false
      t.integer :user_id, null:false
      t.integer :group_id, null:false
    end
  end
end

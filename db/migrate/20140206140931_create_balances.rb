class CreateBalances < ActiveRecord::Migration
  def change
    create_table :balances do |t|
      t.integer :first_user_id
      t.integer :second_user_id
      t.decimal :amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end

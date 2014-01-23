class AddSettledAttoPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :settled_at, :datetime
  end
end

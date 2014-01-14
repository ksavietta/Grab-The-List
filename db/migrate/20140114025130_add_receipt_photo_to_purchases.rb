class AddReceiptPhotoToPurchases < ActiveRecord::Migration
  def change
    add_column :purchases, :receipt_photo, :string
  end
end

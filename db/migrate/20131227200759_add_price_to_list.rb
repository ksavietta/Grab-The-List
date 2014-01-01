class AddPriceToList < ActiveRecord::Migration
  def change
    add_column :lists, :price, :decimal, :precision => 8, :scale => 2
  end
end

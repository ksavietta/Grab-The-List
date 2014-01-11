class DropListsTable < ActiveRecord::Migration
  def up
    drop_table :lists
  end

  def down
    create_table :lists do |t|
      t.string :name, null:false
      t.text :description
      t.string :state, null:false, default: "open"
    end
    add_column :lists, :price, :decimal, :precision => 8, :scale => 2
  end
end

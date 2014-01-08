class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.datetime :purchased_at
      t.integer :group_id, null:false
    end
  end
end

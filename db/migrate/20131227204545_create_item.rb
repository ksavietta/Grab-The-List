class CreateItem < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null:false
      t.boolean :purchased, default:"false"
      t.integer :list_id, null:false
    end
  end
end

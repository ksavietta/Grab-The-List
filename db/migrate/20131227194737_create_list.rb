class CreateList < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, null:false
      t.text :description
      t.string :state, null:false, default: "open"
    end
  end
end


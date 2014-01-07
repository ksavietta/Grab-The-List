class CreateGroup < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name, null:false
    end
  end
end

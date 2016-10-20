class CreateItems < ActiveRecord::Migration
  def change
    t.string :title
    t.integer :inventory
    t.integer :price
    t.integer :category_id

    timestamps null: false
  end
end

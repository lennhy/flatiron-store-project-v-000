class CreateCategories < ActiveRecord::Migration
  def change
    t.string :title

    timestamps null: false
  end
end

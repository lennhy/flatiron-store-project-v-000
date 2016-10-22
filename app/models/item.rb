class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items


  def self.available_items
    items =[]
    self.all.map do |item|
      if item.inventory > 0
        items << item
      else
        nil
      end
    end
    items
  end

  def subtract_from_inventory(value)
    # binding.pry
    total_inventory = 0
    self.all.map do |item|
      total_inventory += item.inventory
    end
    total_inventory

    # line_items_total = @cart.line_items.quantity
    #
    new_inventory_total = total_inventory - value
    self.update(:inventory=>new_inventory_total)
    # self.update(inventory: value)
    self.status == "submitted"
  end

end

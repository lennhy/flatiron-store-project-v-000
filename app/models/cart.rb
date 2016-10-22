class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total_price = 0
    self.items.map do |item|
      total_price += item.price
    end
    total_price
  end

  def add_item(item_id)
    line_item = self.line_items.find_by(:item_id=> item_id)

    unless !line_item
      line_item.quantity +=1
    else
      line_item = self.line_items.create(:item_id=> item_id)
    end
    line_item.save

  end


  def subtract_from_inventory
    # if self.status == "submitted"
        self.line_items.each do |line_item|
          line_item.item.inventory -= line_item.quantity
          line_item.item.save
        end

      # end
  end

  def checkout
    subtract_from_inventory
    # remove_inventory
    # user.remove_cart
    # update(status: 'submitted')
  end


end

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
      line_item = LineItem.find_by(item_id: item_id, cart_id: self.id)

      if line_item
        line_item.quantity += 1
        line_item.save
        line_item
      else
        line_items.build(item_id: item_id)
      end

    end

    def change_status
      self.update(:status=>"submitted")
    end

    def update_items
      line_items.each do |line_item|
        line_item.item.inventory -= line_item.quantity
        line_item.item.save
      end
    end


   def checkout
     update_items
     change_status
     self.user.remove_cart
   end

 end

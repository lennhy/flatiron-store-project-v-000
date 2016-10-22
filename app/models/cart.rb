class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user
  # before_create :set_value
  # validates :item, presence: true
  # validate :carts_not_nil
  #

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
      line_item = self.line_items.new(:item_id=> item_id)
    end
    line_item

  end

  def total_quantity_of_line_items
    total_line_items = 0
    self.line_items.each do |line_item|
      total_line_items += line_item.quantity
    end
    total_line_items  # --get total quantity of line items from cart
  end


  def change_status
    self.status == "submitted"
  end

  def subtract_from_inventory
    if self.status = "submitted"
        self.line_items.each do |line_item|
          line_item.item.inventory -= line_item.quantity
          line_item.item.save
        end

      end
  end

  def checkout
    # current_user.id = @cart.user_id
    current_user.current_cart = nil
  end
  # def total_inventory_of_items
  #   total_item_inventory = 0
  #   self.items.each do |item|
  #     total_item_inventory += item.inventory
  #   end
  #   total_item_inventory # --get total inventory of items from cart
  # end
  #
  # def subtract_from_inventory
  #   binding.pry
  #
  #   remaining_items = total_inventory_of_items - total_quantity_of_line_items # --subtract them
  #   self.items.update(:inventory=> remaining_items) # --update the cart's item inventory
  #
  # end

end

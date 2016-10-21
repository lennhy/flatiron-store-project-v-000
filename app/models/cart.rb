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
end

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

end

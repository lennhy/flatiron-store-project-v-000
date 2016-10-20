class User < ActiveRecord::Base
  has_many :carts
  has_one :current_cart, :class_name => "Cart"

  devise :database_authenticatable, :registerable, :rememberable, :validatable

  def carts
    if self.carts.nil?
      Cart.find_or_create_by(:user_id=> self.id)
    end
  end

end

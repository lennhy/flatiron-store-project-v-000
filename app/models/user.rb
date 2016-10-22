class User < ActiveRecord::Base
  has_many :carts
  has_one :current_cart, :class_name => "Cart"

  devise :database_authenticatable, :registerable, :rememberable, :validatable


 def remove_cart
   self.update(:current_cart=> nil)
 end

end

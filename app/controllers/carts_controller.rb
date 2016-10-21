class CartsController < ApplicationController
  before_filer :authenticate_user!, except: [ :index, :show ]


  # get request to see cart
  def show

  end
  # post request to add to Cart
  def create

  end

# def set_cart
#   if Cart.nil?
#     Cart.find_or_initialize_by(:user_id=> )
#   end
# end
end

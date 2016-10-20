class CartsController < ApplicationController
  before_filer :authenticate_user!, except: [ :index, :show ]



# def set_cart
#   if Cart.nil?
#     Cart.find_or_initialize_by(:user_id=> )
#   end
# end
end

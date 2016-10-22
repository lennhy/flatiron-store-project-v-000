class LineItemsController < ApplicationController

  def create
      current_user.create_current_cart unless current_user.current_cart

    current_user.current_cart.add_item(params[:item_id])

      if current_user.current_cart.save
        redirect_to cart_path(current_user.current_cart), {notice: 'Item added to cart!'}
      else
        redirect_to store_path, {notice: 'Unable to add item'}
      end

    end
end

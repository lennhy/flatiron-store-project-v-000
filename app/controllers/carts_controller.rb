class CartsController < ApplicationController

def index
  @cart = Cart.find(params[:id])

end

  def show
    @cart = Cart.find(params[:id])
    @cart.checkout

  end

  def checkout

    current_cart.checkout
    redirect_to cart_path(current_cart)
  end


end

class CartsController < ApplicationController

  def index
  end

  # get request to see cart
  def show
    @cart = Cart.find(params[:id])
    session[:cart_id] = @cart.id
  end

  def checkout
    @cart = Cart.find(params[:id])
    session[:cart_id] = @cart.id
    @cart.subtract_from_inventory
  end
  # post request to add to Cart
  def create

  end


end

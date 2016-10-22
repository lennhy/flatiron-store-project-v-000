class CartsController < ApplicationController

  def index
    @cart = Cart.find(params[:id])
  end

  # get request to see cart
  def show
    @cart = Cart.find(params[:id])

  end

  def checkout
    @cart = Cart.find(params[:id])
    @cart.change_status
    @cart.subtract_from_inventory

    redirect_to cart_path(@cart)
  end
  # post request to add to Cart
  def create

  end


end

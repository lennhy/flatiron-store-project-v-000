class CartsController < ApplicationController


  def show
    @cart = Cart.find(params[:id])
    @cart.checkout

  end

  def checkout

  end


end

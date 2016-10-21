module CartsHelper

  def current_cart
  #   if !session[:cart_id].nil?
  #    Cart.find(session[:cart_id])
  #  else
  #    Cart.new
  #  end
  @cart = Cart.find(params[:id])
  session[:cart_id] = @cart.id

  end
end

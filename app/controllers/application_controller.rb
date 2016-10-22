class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate_user!, except: [ :index, :show ]
  helper_method :current_cart

  def current_cart
    @cart = Cart.find(params[:id])
    session[:cart_id] = @cart.id
  end

end

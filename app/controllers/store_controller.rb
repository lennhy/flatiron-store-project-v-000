class StoreController < ApplicationController

  def index
    @categories = Category.all
    @items = Item.all.available_items
    # if @categories.nil?
    #   flash[:notice]= "There are no items in the store"
    # end
  end

end

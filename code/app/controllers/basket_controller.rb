
class BasketController < ApplicationController
 
  layout 'administration'
 
  def current_basket
    session[:basket_id] ||= Basket.create.id
    @current_basket ||= Basket.find(session[:basket_id])
  end

  def add
    product = Product.find(params[:product_id])
    Item.create(:basket => current_basket, :product => product, :price => product.price)
    redirect_to :action => 'show'
  end

  def remove
    item = Item.find(params[:item_id])
    item.destroy
    redirect_to :action => 'show'
  end

  def show
    @basket = current_basket
  end

end

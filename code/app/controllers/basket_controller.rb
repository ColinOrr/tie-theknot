
class BasketController < ApplicationController
 
  layout 'administration'
 
  def current_basket
    unless(session[:basket_id])
      basket = Basket.new
      basket.save(:validate => false)
      session[:basket_id] = basket.id
    end
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

  def checkout
    @basket = current_basket
  end

  def paypal
    @basket = current_basket

    if @basket.update_attributes(params[:basket])
      @basket.status = 'Ordered'
      @basket.save
      redirect_to @basket.paypal_url(merchandise_path)
    else
      render action: "checkout"
    end
  end

end

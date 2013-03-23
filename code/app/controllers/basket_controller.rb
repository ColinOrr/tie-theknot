
class BasketController < ApplicationController
 
  layout 'administration'
  protect_from_forgery :except => [:notify]
 
  def current_basket
    if session[:basket_id]
      @current_basket ||= Basket.find_by_id(session[:basket_id]) 
      if @current_basket.nil? or @current_basket.status == 'Completed'
        session[:basket_id] = nil
      end
    end
    if session[:basket_id].nil?
      @current_basket = Basket.new
      @current_basket.save(:validate => false)
      session[:basket_id] = @current_basket.id
    end
    @current_basket
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
      redirect_to @basket.paypal_url(merchandise_url, basket_notify_url)
    else
      render action: "checkout"
    end
  end

  def notify
    @basket = Basket.find(params[:invoice])
    @basket.status = params[:payment_status]
    if @basket.status == 'Completed'
      @basket.items.each do |item|
        product = item.product
        product.quantity = product.quantity - 1 if not product.quantity.nil?
        product.save
      end
    end
    @basket.save(:validate => false)
    render :nothing => true
  end

end

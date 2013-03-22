
class MerchandiseController < ApplicationController

  layout 'administration'

  def count_basket_items
    if Basket.exists?(session[:basket_id])
      return Basket.find(session[:basket_id]).items.count
    end
    return nil
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:priority).reverse_order
    @basket_size = count_basket_items

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end

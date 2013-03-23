
class MerchandiseController < ApplicationController

  layout 'administration'

  def count_basket_items
    basket = Basket.find_by_id(session[:basket_id])
    if basket.nil? or basket.status == 'Completed'
      return nil
    end
    return basket.items.count
  end

  # GET /products
  # GET /products.json
  def index
    @products = Product.order('category, priority desc, price')
    @basket_size = count_basket_items

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end

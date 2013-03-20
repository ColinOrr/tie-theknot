
class MerchandiseController < ApplicationController

  layout 'administration'

  # GET /products
  # GET /products.json
  def index
    @products = Product.order(:priority).reverse_order

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

end

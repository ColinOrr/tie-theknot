class Item < ActiveRecord::Base
  attr_accessible :basket_id, :price, :product_id, :product, :basket
  belongs_to :product
  belongs_to :basket
end

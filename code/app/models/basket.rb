class Basket < ActiveRecord::Base
  attr_accessible :message, :shopper, :status
  has_many :items

  def total_price
    items.to_a.sum(&:price)
  end
  
end

class Basket < ActiveRecord::Base
  attr_accessible :message, :shopper, :status
  has_many :items
  validates :shopper, :presence => true

  def total_price
    items.to_a.sum(&:price)
  end

  def paypal_url(return_url, notify_url)
    
    values = {
      :business => SECRET["paypal_account"],
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => id,
      :currency_code => 'GBP'
    }

    items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.price,
        "item_name_#{index+1}" => item.product.name,
        "item_number_#{index+1}" => item.id,
        "quantity_#{index+1}" => 1
      })
    end
    
    "https://www.paypal.com/uk/cgi-bin/webscr?" + values.to_query
  end
  
end

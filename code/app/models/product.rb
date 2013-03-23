class Product < ActiveRecord::Base
  attr_accessible :category, :description, :image, :name, :price, :priority, :quantity, :label
  validates :name, :price, :category, :presence => true
  validates :price, :numericality => { :greater_than => 0 }
end

class Product < ActiveRecord::Base
  belongs_to :category
  has_many :carts
  has_many :product_prices
  has_many :orders

  validates :category_id, :presence => true

  def get_product_price
    product_prices.where("effective_start_date <= ?", Date.today).order("effective_start_date DESC").first
  end

end

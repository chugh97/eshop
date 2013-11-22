class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_prices
  validates :category_id, :presence => true

  def get_product_price
    product_prices.where("effective_start_date >= ?", Date.today)
  end

end

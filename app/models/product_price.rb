class ProductPrice < ActiveRecord::Base
  belongs_to :product  #fk is product_id

  def self.get_price
    where("effective_start_date <= ?", Date.today).order("effective_start_date DESC").first
  end
end

class ProductPrice < ActiveRecord::Base
  belongs_to :product  #fk is product_id

end

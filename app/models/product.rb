class Product < ActiveRecord::Base
  belongs_to :category

  validates :category_id, :presence => true

end

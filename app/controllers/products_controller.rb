class ProductsController < ApplicationController

  def index
   @products = Product.includes(:category).all
  end
end

class ProductsController < ApplicationController
  include ProductsHelper
  def index
   @products = Product.includes(:category).all
  end
end

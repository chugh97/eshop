class CartsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:update]

  def new

  end

  def add
    if !products_in_existing_cart.any?
      product_price = get_product_price()
      Cart.create!(:session_id => session[:session_id], :product_id => params[:product][:id], :quantity => params[:product][:quantity], :unit_price => product_price[:price])
    else
      existing_line_item = products_in_existing_cart.first
      existing_line_item.quantity = params[:product][:quantity].to_i + existing_line_item.quantity
      existing_line_item.unit_price = get_product_price[:price]
      existing_line_item.save!
    end
    redirect_to products_path
  end

  def products_in_existing_cart
    Cart.where("session_id = ? AND product_id = ?", session[:session_id], params[:product][:id])
  end

  def index

  end

  def show
   @cart =  Cart.where(:session_id => session[:session_id])
   render json: @cart
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def get_product_price
    product = Product.find_by(:id => params[:product][:id])
    product_price = product.get_product_price
  end

end

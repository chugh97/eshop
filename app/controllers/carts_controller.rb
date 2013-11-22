class CartsController < ApplicationController

  def new

  end

  def add
    #if !Cart.find_by(:session_id => session[:session_id])
      product = Product.find_by(:id => params[:product][:id])
      product_price = product.get_product_price.first
      Cart.create!(:session_id => session[:session_id], :product_id => params[:product][:id], :quantity => params[:product][:quantity], :unit_price => product_price[:price])


      #render json: @cart
      #redirect_to products_path(@cart, format: :json)
    #  return
    #end
    redirect_to products_path

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
end

class CartsController < ApplicationController

  skip_before_filter :verify_authenticity_token, :only => [:update]

  def new

  end

  def add
    if !products_in_existing_cart.any?
      product_price = get_product_price
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
   @cart =  Cart.includes(:product).where(:session_id => session[:session_id])
   render json: @cart.as_json
  end

  def create

  end

  def edit

  end

  def update
    @cart =  Cart.where(:session_id => session[:session_id])
    @cart.each do |lineitem|
       if params.keys.include?(lineitem[:product_id].to_s)
         lineitem[:quantity] = params[lineitem[:product_id].to_s]
         lineitem.save!
       else
         lineitem.destroy!
       end
    end
    redirect_to products_path
  end

  def deletelineitem
    msg = {}
    begin
        lineitem = Cart.where("session_id = ? and product_id = ?", session[:session_id], params['_json']).first
        lineitem.destroy!
        msg[:output] =  "Successfully deleted line item."
      rescue
        msg[:output] = "An error has occured"
      ensure
    end
    render json: msg
  end

  def destroy
    redirect_to products_path
  end

  private

  def get_product_price
    product = Product.find_by(:id => params[:product][:id])
    product_price = product.get_product_price
  end

end

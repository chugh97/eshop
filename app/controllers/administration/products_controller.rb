class Administration::ProductsController < ApplicationController

  def index
    @products = Product.all
    render 'administration/index'
  end

  def edit
    @product = Product.find_by_id(params[:id])
    render 'administration/edit'
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def update
    @product = Product.find_by_id(params[:id])
    product = {:name => params[:name], :description => params[:description], :category_id => params[:category]}
    if @product.update_attributes(product)
      flash[:success] = "Product updated successfully."
      redirect_to action: "index"
    else
      flash[:error] = "Please select a category."
      render 'administration/edit', :product => @product
    end
  end

  def categories
    Category.all
  end
end
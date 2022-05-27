class ProductsController < ApplicationController

  def show
    @products = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end
  
  def search(search)
      @products = Product.where(name: params[:search])
  end
  
end

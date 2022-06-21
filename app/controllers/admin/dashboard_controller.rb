class Admin::DashboardController < ApplicationController
  def index
    @products = Product.count
    @categories = Category.count
    @orders = Order.count
  end
end

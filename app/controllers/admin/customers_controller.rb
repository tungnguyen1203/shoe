class Admin::CustomersController < ApplicationController
  def index
    @customers = User.all
  end

  def destroy
    @customers = User.find(params[:id])
    if @customers.destroy
      flash[:success] = 'Đã xóa!'
      redirect_to admin_customers_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to admin_customers_path
    end
  end
end
class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all
    # @order = Order.find(params[:id])
  end
  
  def edit
   
    @order = Order.find(params[:id])
  end
  
  def update
    
    @order = Order.find(params[:id])
      if @order.update(order_params)
        flash[:success] = "Đã chỉnh sửa! "
        redirect_to admin_orders_path
      else
        flash[:error] = "Loại sản phẩm chưa được cập nhật"
        render 'edit'
      end
  end

  private
    def order_params
      params.require(:order).permit(:status)
    end
end

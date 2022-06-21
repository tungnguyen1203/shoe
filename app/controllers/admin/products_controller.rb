class Admin::ProductsController < ApplicationController

  def index
    @products = Product.all
    
  end

  def new
    @categories = Category.all
    @product = Product.new
  end

  def create
    @categories = Category.all
    @product = Product.new(product_params)
    if @product.save
      flash[:success] = "Đã thêm!"
      redirect_to new_admin_product_path
    else
      flash[:error] = "Sản phẩm chưa được tạo!"
      render 'new'
    end
  end

  def edit
    @categories = Category.all
    @product = Product.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        flash[:success] = "Đã chỉnh sửa!"
        sleep(2)
        redirect_to admin_products_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  def destroy
    @product = Product.find(params[:id])
    if @product.destroy
      flash[:success] = 'Đã xóa!'
      redirect_to admin_products_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to admin_products_path
    end
  end
  
  private

    def product_params
      params.require(:product).permit(:name,:image, :price, :color, :size, :description, :category_id)
    end
    
end

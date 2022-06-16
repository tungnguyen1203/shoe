class Admin::CategoriesController < ApplicationController
 
  def new
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Đã Thêm!"
      redirect_to new_admin_category_path
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end
  
  def destroy
    @category =Category.find(params[:id])
    if @category.destroy
      flash[:success] = 'Đã xóa!'
      redirect_to new_admin_category_path
    else
      flash[:error] = 'Something went wrong'
      redirect_to new_admin_category_path
    end
  end
  
  def edit
    @category = Category.find(params[:id])
    # redirect_to new_admin_category_path
  end
  
  def update
   
    @category = Category.find(params[:id])
      if @category.update(category_params)
        flash[:success] = "Đã chỉnh sửa! "
        redirect_to new_admin_category_path
      else
        flash[:error] = "Something went wrong"
        render 'edit'
      end
  end
  
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
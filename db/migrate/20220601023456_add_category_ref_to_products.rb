class AddCategoryRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :categories, foreign_key: true
  end
end

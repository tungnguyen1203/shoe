class AddCartRefToOrderDetail < ActiveRecord::Migration[6.1]
  def change
    add_reference :order_details, :cart, foreign_key: true
  end
end

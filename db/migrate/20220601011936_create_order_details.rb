class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.integer :price
      t.integer :quantity, :default => 1
      #Ex:- :default =>''
      t.string :status
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end

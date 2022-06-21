class OrderDetail < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart

  def total_price
    self.quantity * self.price
  end

end

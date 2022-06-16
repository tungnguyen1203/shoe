class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :user
  def sub_total
    sum = 0
    order_details.each do |order_detail|
      sum += order_detail.total_price
    end
    return sum
  end
end

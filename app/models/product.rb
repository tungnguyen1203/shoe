class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  validates :name, presence: true, length: { maximum:100 }
  validates :image, presence: true
  validates :price, presence: true
end

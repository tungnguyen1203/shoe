class Product < ApplicationRecord
  validates :name, presence: true, length: { maximum:100 }
  validates :image, presence: true
  validates :price, presence: true

  
end

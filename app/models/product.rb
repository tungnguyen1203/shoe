class Product < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :category
  validates :name, presence: true, length: { maximum:100 }
  validates :image, presence: true
  validates :price, presence: true
  validates :color, presence: true
  validates :size, presence: true, length: { maximum:2}
  mount_uploader :image, ImageUploader
end

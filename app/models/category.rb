class Category < ApplicationRecord
  has_many :products
  validates :name, presence: true, length: {minimum: 6}
end

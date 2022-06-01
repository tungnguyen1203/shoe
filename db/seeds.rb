44.times do |n|
  name  = Faker::Commerce.product_name
  image = Faker::LoremFlickr.image
  price = Faker::Commerce.price
  color = Faker::Commerce.color
  Product.create!(name: name, 
                  image: image, 
                  price: price, 
                  color: color)
end
6.times do |n|
  name = Faker::Commerce.material
  Category.create!(name: name)
end
  
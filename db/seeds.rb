12.times do |n|
  name  = Faker::Commerce.product_name
  image = Faker::LoremFlickr.image
  price = Faker::Commerce.price
  color = Faker::Commerce.color
  Product.create!(name: name, 
                  image: image, 
                  price: price, 
                  color: color)
end
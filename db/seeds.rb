44.times do |n|
  name  = Faker::Commerce.product_name
  image = Faker::LoremFlickr.image
  price = Faker::Commerce.price
  color = Faker::Commerce.color
  category_id =  Faker::Commerce.color
  Product.create!(name: name, 
                  image: image, 
                  price: price, 
                  color: color,
                  category_id: category_id)
end

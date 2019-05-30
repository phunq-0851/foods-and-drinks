Category.create!(name: "Foods")
Category.create!(name: "Drinks")
Product.create!(name: "Banh gato", describe: "Banh ngon phet", quantity: 100, picture: "product.jpg", price: 50000, category_id: 1)

Product.create!(name: "Cocacola", describe: "Nuoc ngon qua", quantity: 100, picture: "product.jpg", price: 50000, category_id: 2)

5.times do
  name = Faker::Name.name
  describe = "Banh ngon qua di"
  quantity = 100
  price = 12000
  picture = "product.jpg"
  category_id = 1
  Product.create!(name: name, describe: describe, quantity: quantity, price: price, picture: picture, category_id: category_id)
end

5.times do
  name = Faker::Name.name
  describe = "Nuoc ngon qua"
  quantity = 100
  price = 12000
  picture = "product.jpg"
  category_id = 2
  Product.create!(name: name, describe: describe, quantity: quantity, price: price, picture: picture, category_id: category_id)
end

User.create!(username: "Quang Phu", email: "quangphunguyen@gmail.com", password: "123456", password_confirmation: "123456", is_admin: true)

Order.create!(user_id: 1, total: 100000, status: 1)
OrderDetail.create!(order_id:1, product_id: 1, quantity: 3, price: 30000)
OrderDetail.create!(order_id:1, product_id: 3, quantity: 5, price: 30000)
OrderDetail.create!(order_id:1, product_id: 4, quantity: 8, price: 30000)
OrderDetail.create!(order_id:1, product_id: 5, quantity: 9, price: 30000)

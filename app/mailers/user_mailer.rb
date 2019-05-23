class UserMailer < ApplicationMailer
  default from: "phube232@gmail.com"
  def send_email email, current_user, shopping_cart, total
    @product = []
    @username = current_user.username
    @shopping_cart = shopping_cart
    @shopping_cart.each do |item|
      product =  Product.find_by id: item["product_id"]
      @product << product
    end
    @total = total
    mail to: email, subject: "Food and Drink"
  end
end

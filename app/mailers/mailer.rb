class Mailer < ActionMailer::Base
  default from: "frank@franks-monsterporium.com"

  def welcome_email(user_data)
    @name = user_data["name"]
    mail(to: user_data["email"], subject: "Welcome to Frank's Monsterporium!")
  end

  def order_confirmation(order_data)
    @name = order_data["name"]
    @items = order_data["items"]
    @total = order_data["total"]
    mail(to: order_data["email"], subject: "Thanks for your purchase!")
  end
end

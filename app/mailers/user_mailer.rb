class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  def order_complete_email(order)
    @order = order
    @url = "http://localhost:3000/"
    mail(to: @order.email, subject: "Order \#: #{order.id} Complete! Thank you")
  end
end

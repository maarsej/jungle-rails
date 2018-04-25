class UserMailer < ApplicationMailer
  default from: "no-reply@jungle.com"

  # example at: http://localhost:3000/admin/mailer/preview_order_complete_email
  def order_complete_email(order)
    @order = order
    @url = "http://localhost:3000/"
    mail(to: @order.email, subject: "Order \#: #{order.id} Complete! Thank you")
  end
end

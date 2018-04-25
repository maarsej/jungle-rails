class Admin::MailerController < Admin::ApplicationController
  def preview_order_complete_email()
    @order = Order.last
    @url = "http://localhost:3000/"
    render :file => "user_mailer/order_complete_email.html.erb", :layout => "mailer"
  end
end

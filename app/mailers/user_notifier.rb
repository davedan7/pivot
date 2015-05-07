class UserNotifier < ApplicationMailer
  default from: "Hipster Bytes"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with Hipster Bytes")
  end

  def order_confirmation(order)
    @order = order
    # require 'pry'; binding.pry
    mail(to: @order.user.email, subject: 'Order has been received')
  end
end

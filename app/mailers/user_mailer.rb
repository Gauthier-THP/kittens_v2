class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def user_order_email(order)
    @order = order 

    mail(to: @order.user.email, subject: 'New order') 
  end
end
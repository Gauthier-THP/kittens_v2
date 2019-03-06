class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def admin_order_email(order)
    @order = order 



    mail(to: "azerty966@yopmail.com", subject: 'New order') 
  end
end

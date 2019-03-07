class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def admin_order_email(order)
    @order = order 
    mail(to: "liobe.malogo@gmail.com", subject: 'New order') 
  end
end

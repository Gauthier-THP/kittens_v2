class AdminMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'
 
  def admin_order_email(admin)
    @admin = admin 

    @url  = 'http://monsite.fr/login' 

    mail(to: "azerty966@yopmail.com", subject: 'Bienvenue chez nous !') 
  end
end

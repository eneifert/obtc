class ContactMailer < ActionMailer::Base
  default from: "info@obtc.kg"

  def welcome_email(user)
  	@user = user
  	@url = 'http://example.com/login'
  	mail(to: @user.email, subject: 'Welcome to my awesome site')
  end
end

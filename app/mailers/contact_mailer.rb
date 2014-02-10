class ContactMailer < ActionMailer::Base
  default from: "notifications@obtc.kg"

  def obtc_message(email)  	
  	@email = email
  	mail(from: @email.email, to: 'eric@obtc.kg', subject: @email.name + ' sent you a message from obtc.kg' )
  end
end

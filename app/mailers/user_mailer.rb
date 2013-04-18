class UserMailer < ActionMailer::Base
  default from: "notifications@esportsinitiative.com"
  
  def welcome_email(user)
    @user = user
	@url = "localhost:3000/signup"
	mail(to: user.email, subject: "Welcome to the ESI Site :3")
  end
end

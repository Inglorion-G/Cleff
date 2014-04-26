class UserMailer < ActionMailer::Base
  default from: "notifications@cleff.com"
  
  def welcome_email(user)
    @user = user
    @url = 'htp://cleff.com/login'
    mail(to: user.email, subject: 'Welcome to Cleff!')
  end
  
end

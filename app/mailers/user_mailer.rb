class UserMailer < ActionMailer::Base
  default from: "lionstour@example.com"
  
  def welcome_email(user)
     @user = user
     @url  = "http://example.com/login"
     mail(:to => user.email, :subject => "Welcome to Lionstour 2013")
   end
end

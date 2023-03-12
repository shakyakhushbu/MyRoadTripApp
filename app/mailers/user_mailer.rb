class UserMailer < ApplicationMailer
  
  def welcome_email(user)
    @user = user.first_name
    mail(to: 'test1@yopmail.com', subject: "You have successfully signed in!")
    # mail(to: user.email, subject: "You have successfully signed in!")
  end
end

class UserMailer < ApplicationMailer
  def welcome_email
    @user = User.last
    @email = User.last.email
    mail(to: 'test1@yopmail.com', subject: "You have successfully signed in!")
    # mail(to: @email, subject: "You ahve successfully signed in!")
  end
end

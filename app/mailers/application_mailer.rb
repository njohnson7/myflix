# app/mailers/application_mailer.rb

class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'

  def send_welcome_email user
    @user = user
    mail to: user.email, from: 'info@myflix.com', subject: 'Welcome to MyFlix!'
  end
end

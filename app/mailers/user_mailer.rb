class UserMailer < ApplicationMailer
    default from: 'notifications@railsbook.com'
 
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Welcome to railsbook!')
    end
end

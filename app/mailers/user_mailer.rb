class UserMailer < ApplicationMailer
    default from: 'notifications@railsbook.com'
 
    def welcome_email(user)
      @user = user
      @url = root_url
      mail(to: @user.email, subject: 'Welcome to railsbook!')
    end
end

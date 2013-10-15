class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user, url)
    @user = user
    @url = url
    mail(to: user.email, subject: "Password Reset Request")
  end
end

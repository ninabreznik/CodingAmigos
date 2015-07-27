# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def welcome_email
    user = User.first
    pass = "78nnhk98123e"
    UserMailer.welcome_email(user, pass)
  end



end



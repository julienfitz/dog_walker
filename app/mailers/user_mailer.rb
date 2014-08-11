class UserMailer < ActionMailer::Base
  default from: "donotreply@petsitfor.me"

  def new_client_email(walker)
    @walker = walker
    mail(to: @walker.email, subject: 'New petsitfor.me client')
  end

end

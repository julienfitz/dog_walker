class UserMailer < ActionMailer::Base
  default from: "donotreply@petsitfor.me"

  def new_client_email(params)
    @walker = User.find(params[:walker_id])
    @name = params[:name]
    @phone = params[:phone]
    @email = params[:email]
    @message = params[:text]
    mail(to: @walker.email, subject: 'New petsitfor.me client')
  end

end

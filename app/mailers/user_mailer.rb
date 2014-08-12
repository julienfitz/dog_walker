class UserMailer < ActionMailer::Base
  default from: "donotreply@petsitfor.me"

  def new_client_email(params)
    @walker = User.find(params[:walker_id])
    @name = params[:name]
    @phone = params[:phone]
    @email = params[:email]
    @message = params[:text]
    # change this back to @walker.email before deploying to heroku
    mail(to: ["vanessa.dean@gmail.com", "liz@lizbaillie.com", "ashley.blewer@gmail.com"], subject: 'New petsitfor.me client')
  end

end

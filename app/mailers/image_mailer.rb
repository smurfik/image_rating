class ImageMailer < ApplicationMailer

  def rate
    # @user = User.find(user_id)
    @user = User.find(1)
    mail to: "tamaramitryakova@yahoo.com", subject: "Thanks for your rating, #{@user.username}!"
  end

end

class ImageMailer < ApplicationMailer

  def rate(user_id, review_id)
    @review = Review.find(review_id)
    @user = User.find(user_id)
    mail to: "#{@user.email}", subject: "Thanks for your rating, #{@user.username.capitalize}!"
  end

  def subscribe(user_id)
    @user = User.find(user_id)
    mail to: "#{@user.email}", subject: "Thanks for subscribing, #{@user.username.capitalize}!"
  end

end

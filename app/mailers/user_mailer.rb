class UserMailer < ActionMailer::Base
  default from: "joseluis.estrach@gmail.com"

  def email_to_user_product(product, user)
    @user = product.user_id
    mail(to: @user.email, subject: 'Make a deal in ExcahngeIt')
  end

  def email_to_new_product(product, user)
    @user = user
    @product = product
    mail(to: user.email, subject: 'You have a new product in ExcahngeIt')
  end
end
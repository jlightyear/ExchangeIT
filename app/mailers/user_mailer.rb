class UserMailer < ActionMailer::Base
  default from: ENV['FROM_MAIL']

  def email_to_user_product(product, current_user, message)
    @product_user = product.user
    @user = current_user
    @product = product
    @message = message
    mail(to: @product_user.email, subject: 'Make a deal in ExchangeIt')
  end

  def email_to_new_product(product, user)
    @user = user
    @product = product
    mail(to: product.user.email, subject: 'You have a new product in ExchangeIt')
  end
end
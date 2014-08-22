class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def email_to_user_product(product)
    @user = product.user_id
    mail(to: @user.email, subject: 'Make a deal in ExcahngeIt')
  end
end

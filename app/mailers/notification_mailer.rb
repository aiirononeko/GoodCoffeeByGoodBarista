class NotificationMailer < ApplicationMailer
  default from: "aiirononeko@gmail.com"

  def send_confirm_to_user(user)
    @user = user
    mail(
      subject: "面談のお誘いが届いています！",
      to: @user.email
    ) do |format|
      format.text
    end
  end

  def send_confirm_to_owner(owner)
    @owner = owner
    mail(
      subject: "面談の申し込みがありました！",
      to: @owner.email
    ) do |format|
      format.text
    end
  end
end

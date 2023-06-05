class StaffMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.staff_mailer.reset_password_email.subject
  #
  def reset_password_email(staff)
    @url =  edit_staffs_password_resets_url(token: staff.reset_password_token)
    # mail to: "to@example.org"
    mail(to: staff.email, subject: 'パスワード再設定を受け付けました。')
  end
end

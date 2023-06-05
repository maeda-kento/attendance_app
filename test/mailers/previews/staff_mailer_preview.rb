# Preview all emails at http://localhost:3000/rails/mailers/staff_mailer
class StaffMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/staff_mailer/reset_password_email
  def reset_password_email
    StaffMailer.reset_password_email
  end

end

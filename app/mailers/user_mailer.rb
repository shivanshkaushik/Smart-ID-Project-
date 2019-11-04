class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.registration_confirmation.subject
  #
  def registration_confirmation(student)
    @student = student
    mail(:to => student.email, :subject => "Registration Confirmation")
  end
end

class UserNotifier < ApplicationMailer
  default from: "jobbyjobs@gmail.com"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with JobbyJobs")
  end

  def order_confirmation(job_application)
    @job_application = job_application
    mail(to: @job_application.user.email, subject: 'Application has been received')
  end
end

class UserNotifier < ApplicationMailer
  default from: "turing.pivot.group@gmail.com"

  def send_signup_email(user)
    @user = user
    mail(to: @user.email,
         subject: "Thanks for signing up for with JobbyJobs")
  end

  def job_application_confirmation(job_application)
    @job_application = job_application
    mail(to: @job_application.user.email, subject: 'Application has been received')
  end

  def business_registration_confirmation(business)
    @business = business
    mail(to: "turing.pivot.group@gmail.com", subject: "Business Application from: #{@business.name}")
  end
end

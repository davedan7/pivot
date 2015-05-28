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
    mail(to: @business.email, subject: "Business Application from: #{@business.name}")
  end

  def business_status_changed(business)
    @business = business
    mail(to: @business.email, subject: "Online/Offline Status has been changed")
  end

  def job_application_status_changed(user, status)
    @user = user
    @status = status
    mail(to: User.find(@user).email, subject: "Your Job Application at Jo.bs")
  end
end

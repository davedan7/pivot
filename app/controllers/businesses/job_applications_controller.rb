class Businesses::JobApplicationsController < ApplicationController

  def index
    all_applications = JobApplication.first(200)
    if current_business?
      @job_applications = all_applications.select { |app| app.job.user.id == current_user.id }
    elsif current_business_admin?
      @job_applications = all_applications.select { |app| app.job.user.id == current_user.employer.id }
    end
  end

end

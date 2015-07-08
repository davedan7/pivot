class Businesses::JobApplicationsController < ApplicationController

  def index
    all_applications = JobApplication.all
    @job_applications = all_applications.select { |app| app.job.user.id == current_user.employer.id }.take(10)
  end

end
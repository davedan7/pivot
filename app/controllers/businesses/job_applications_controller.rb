class Businesses::JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.by_business.paginate(page: params[:page])
    # if current_business?
    #   @job_applications = all_applications.select { |app| app.job.user.id == current_user.id }
    # elsif current_business_admin?
    #   @job_applications = all_applications.select { |app| app.job.user.id == current_user.employer.id }
    # end
  end

end

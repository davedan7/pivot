class User::JobApplicationsController < User::BaseController
  def index
    if current_admin?
      @job_applications = JobApplication.all
    elsif current_business? || current_business_admin?
      all_applications = JobApplication.all
      @job_applications = all_applications.select { |application| application.job.user.id == current_user.id}
    else
      all_applications = JobApplication.all
      @job_applications = all_applications.select { |application| application.user_id == current_user.id}
    end
  end

  def show
    @job_application = current_user.job_applications.find(params[:id].to_i)
  end
end

class User::JobApplicationsController < User::BaseController
  def index
    @job_applications = current_user.job_applications
  end

  def show
    @job_application = current_user.job_applications.find(params[:id].to_i)
  end
end

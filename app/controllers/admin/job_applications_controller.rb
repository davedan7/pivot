class Admin::JobApplicationsController < Admin::BaseController

  def dashboard
    @job_apps_summary = JobApplication.all
    @job_applications   = JobApplication.all.paginate(page: params[:page])
    @statuses = ["received", "accepted", "rejected"]
  end

  def show
    @job_application = JobApplication.find_by(id: params[:job_application_id].to_i)
  end

  def update
    job_application = JobApplication.find_by(id: params[:job_application_id].to_i)
    if job_application.update(status: params[:status])
      flash[:success] = "Job Application #{job_application.id} status changed to #{params[:status]}"
      redirect_to admin_job_application_path(job_application_id: job_application.id)
    else
      flash[:danger] = job_application.errors.full_messages.join(", ")
      redirect_to admin_job_application_path(job_application_id: job_application.id)
    end
  end
end

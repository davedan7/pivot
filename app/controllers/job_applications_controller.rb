class JobApplicationsController < ApplicationController
  
  def index
    @job_applications = JobApplication.all.where(user_id: current_user.id)
  end

  def create
    job_applications = @cart.contents.keys.map do |job_id|
    job_application = JobApplication.new(user_id: params[:job_application][:user_id], job_id: job_id.to_i)
      if job_application.save
        UserNotifier.job_application_confirmation(job_application).deliver_now
         true
      else
         false
      end
    end

    if job_applications.all?
      flash[:success] = "Job Application Successfully Placed"
      redirect_to checkout_summary_path(jobs: @cart.contents)
    else
      flash[:danger] = "Please try again"
      redirect_to checkout_path
    end
    @cart.clear
  end

  def payment
  end

  private

  def job_application_params
    params.require(:job_application).permit(:user_id)
  end
end

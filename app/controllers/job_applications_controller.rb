class JobApplicationsController < ApplicationController
  def create
    job_applications = @cart.contents.map do |job_id|
    job_application = JobApplication.new(user_id: params[:job_application][:user_id], job_id: job_id.to_i)
      job_application.save
    end
    if job_applications.all?
      ##not ready
      # UserNotifier.order_confirmation(JobApplication.find(job_application.id)).deliver_now
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

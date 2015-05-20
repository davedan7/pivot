class JobApplicationsController < ApplicationController
  def create
    job_application = JobApplication.new(job_application_params)
    if job_application.save
      @cart.contents.each_pair do |job_id, q|
        job_application.create(job_id: job_id.to_i)
      end
      job_application.create()
      UserNotifier.order_confirmation(JobApplication.find(job_application.id)).deliver_now
      flash[:success] = "JobApplication Successfully Placed"
      redirect_to orders_payment_path
    else
      flash[:danger] = "Grow your beard, try again"
      redirect_to checkout_path
    end
    @cart.clear
  end

  def payment
  end

  private

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_id)
  end
end

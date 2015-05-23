class Businesses::JobsController < ApplicationController

  def index
    @business = User.find_by(slug: params[:business])
    @jobs = @business.jobs
  end

  def new
    @job = Job.new()
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:success] = "Job posting successfully created!"
      redirect_to business_job_path(@job)
    else
      flash[:danger] = @job.errors.full_messages.join(", ")
      render :new
    end
  end


  private

    def job_params  #Error message job cannot be empty
      params.require(:job).permit(:title,
                                  :description,
                                  :posting_cost)
    end

end

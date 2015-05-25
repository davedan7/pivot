class Businesses::JobsController < ApplicationController

  def index
    @business = User.find_by(slug: params[:business])
    @jobs = @business.jobs
  end

  def new
    @job = Job.new()
  end

  def show
    @business = User.find_by(slug: params[:business])
    @job = @business.jobs.find(params[:id])
  end

  def create
    @business = User.find_by(slug: params[:business])
    @job = @business.jobs.new(job_params)
    if @job.save
      flash[:success] = "Job posting successfully created!"
      redirect_to business_jobs_path
    else
      flash[:danger] = @job.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @business = User.find_by(slug: params[:business])
    @job = @business.jobs.find(params[:id])
    @categories = Category.all
  end

def update
  @business = User.find_by(slug: params[:business])
  @job = @business.jobs.find(params[:id])
  if @job.update(job_params)
    flash[:sucess] = "#{@job.title} was updated"
    redirect_to business_job_path(job_id: @job.id)
  else
    flash[:danger] = @job.errors.full_messages.join(", ")
    render :edit
  end
end

  private

    def job_params
      params.require(:job).permit(:title,
                                  :description,
                                  :posting_cost)
    end

end

class Admin::JobsController < Admin::BaseController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @categories = Category.all
    @businesses = User.business
    @job        = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      categories = params[:job][:category_ids].reject(&:empty?)
      categories.each do |id|
        @job.categories << Category.find(id)
      end
      flash[:success] = "#{@job.title} created!"
      redirect_to admin_job_path(@job)
    else
      flash[:danger] = @job.errors.full_messages.join(", ")
      redirect_to request.referrer
    end
  end

  def edit
    @job        = Job.find(params[:id])
    @businesses = User.business
    @categories = Category.all
  end

  def update
    @job = Job.find(params[:id])
    categories = params[:job][:category_ids].reject(&:empty?)
    if @job.update(job_params)
      @job.modify_status(params[:status])
      @job.categories.destroy_all
      categories.each do |id|
        @job.categories << Category.find(id)
      end
      flash[:success] = "#{@job.title} Updated"
      redirect_to admin_job_path(@job)
    else
      flash[:danger] = @job.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def job_params
    params.require(:job).permit(:title,
                                 :description,
                                 :posting_cost,
                                 :status,
                                 :category_ids,
                                 :user_id)
  end
end

class CheckoutsController < ApplicationController

  def create
    job = Job.find(params[:job_id])
    if job.retired
      flash[:danger] = "Retired job cannot be added to cart"
      redirect_to categories_path
    else
      @cart.add_job(job.id)
      session[:cart] = @cart.contents
      flash[:success] = "You now have #{pluralize(@cart.count_of(job.id), job.title)} in your basket.  "
      redirect_to categories_path
    end
  end

  def show
    @jobs = @cart.find_jobs
  end

  def confirmation
    @jobs           = @cart.find_jobs
    @job_quantities = @cart.contents
    if @jobs.empty?
      flash[:danger] = "Your basket can't be empty!"
      redirect_to categories_path
    end
  end

  def summary
    @jobs = params[:jobs].map { |id| Job.find(id.to_i)}
  end

  # def increase
  #   @cart.increase_quantity(params[:job_id])
  #   redirect_to checkout_path
  # end
  #
  # def decrease
  #   @cart.decrease_quantity(params[:job_id])
  #   redirect_to checkout_path
  # end

  def remove
    job = @cart.remove_job(params[:job_id])
    redirect_to checkout_path
  end
end

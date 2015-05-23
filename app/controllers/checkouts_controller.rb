class CheckoutsController < ApplicationController

  def create
    job = Job.find(params[:job_id])
    if job.retired
      flash[:danger] = "Retired job cannot be added to cart"
      redirect_to request.referrer
    else
      @cart.add_job(job)
      flash[@cart.flash_type.to_sym] = @cart.flash_message
      session[:cart] = @cart.contents
      redirect_to request.referrer
    end
  end

  def show
    @jobs = @cart.contents
  end

  def confirmation
    @jobs = @cart.contents
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

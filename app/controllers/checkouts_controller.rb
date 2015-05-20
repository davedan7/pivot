class CheckoutsController < ApplicationController

  def create
    job = Job.find(params[:item_id])
    if job.retired
      flash[:errors] = "Retired job cannot be added to cart"
      redirect_to categories_path
    else
      @cart.add_job(job.id)
      session[:cart] = @cart.contents
      flash[:notice] = "You now have #{pluralize(@cart.count_of(job.id), job.title)} in your basket.  "
      redirect_to categories_path
    end
  end

  def show
    @items = @cart.find_jobs
    @item_quantities = @cart.contents
  end

  def confirmation
    @items           = @cart.find_valid_items
    @item_quantities = @cart.contents
    if @items.empty?
      flash[:errors] = "Reality Check! Cart can't be empty!"
      redirect_to categories_path
    end
  end

  def increase
    @cart.increase_quantity(params[:job_id])
    redirect_to checkout_path
  end

  def decrease
    @cart.decrease_quantity(params[:job_id])
    redirect_to checkout_path
  end

  def remove
    job = @cart.remove_job(params[:job_id])
    redirect_to checkout_path
  end
end

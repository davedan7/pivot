class JobsController < ApplicationController
  def index
    # @jobs = Job.active
    @jobs = Job.paginate(page: params[:page])
  end

  def show
    @job = Job.find(params[:id])
  end
end

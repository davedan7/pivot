class JobsController < ApplicationController
  def index
    @jobs = Job.active.paginate(page: params[:page])
  end

  def show
    @job = Job.find(params[:id])
  end
end

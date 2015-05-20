class JobsController < ApplicationController
  def index
    @items = Job.active
  end

  def show
    @item = Job.find(params[:id])
  end
end

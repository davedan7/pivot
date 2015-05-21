class Businesses::JobsController < ApplicationController

  def index
    @business = User.find_by(slug: params[:business])
    @jobs = @business.jobs
  end

end

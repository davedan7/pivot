class Businesses::JobApplicationsController < ApplicationController

  def index
    @job_applications = JobApplication.all.where(user_id: current_user.id)
  end

end
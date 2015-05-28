class ResumesController < ApplicationController
  def index
    if current_admin? || current_business? || current_business_admin?
      @resumes = Resume.all
    else
      all_resumes = Resume.all
      @resumes = all_resumes.select { |resume| resume.user_id == current_user.id}
    end
  end

  def new
    @resume = Resume.new
  end

   def create
    @resume = Resume.new(resume_params)
    @resume.user_id = current_user.id

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

private
  def resume_params
    params.require(:resume).permit(:name, :attachment)
  end
end
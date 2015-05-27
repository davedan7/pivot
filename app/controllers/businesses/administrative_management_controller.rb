class Businesses::AdministrativeManagementController < BusinessesController
  before_action :require_business_status

  def require_business_status
    redirect_to "/errors/file_not_found" unless correct_priveleges
  end

  def correct_priveleges
    current_business? || current_admin? 
  end
  # def index
  #   @business_admins = User.business_admins(current_user.id)
  # end

  def index
    # @business_admins = User.business_admin.wh
    @business_admins = current_user.employer.business_managers
  end

  def add
  end

  def submit
    user = User.find_by(email: params[:user][:email])
    user.update(user_params)
    redirect_to business_administrative_management_index_path(business: current_user.slug)
  end


  private

    def user_params
      params.require(:user).permit(:email, :title).merge(employer_id: current_user.id, role: 3)
    end

end

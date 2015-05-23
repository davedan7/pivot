class Businesses::AdministrativeManagementController < BusinessesController

  # before_update :change_role

  def index
    @business_admins = User.business_admins(current_user.id)
  end

  def add
  end

  def submit
    user = User.find_by(email: params[:user][:email])
    # user.submit_admin_info(user_params, current_user.id)
    user.update({business_id: current_user.id, role: 3})
    # byebug
    redirect_to business_administrative_management_index_path(business: current_user.slug)
  end


    private

      def user_params
        params.require(:user).permit(:email)
      end

      def change_role

      end

end

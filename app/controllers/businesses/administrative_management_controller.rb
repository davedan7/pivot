class Businesses::AdministrativeManagementController < BusinessesController

  def index
    @business_admins = User.business_admins(current_user.id)
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
        params.require(:user).permit(:email, :title).merge(business_id: current_user.id, role: 3)
      end

      def change_role

      end

end

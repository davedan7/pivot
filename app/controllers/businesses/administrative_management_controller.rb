class Businesses::AdministrativeManagementController < BusinessesController
  before_action :require_business_status

  def require_business_status
    redirect_to "/errors/file_not_found" unless correct_priveleges
  end

  def index
    @business = User.find_by(slug: params[:business])
    @business_admins = @business.business_managers.not_business
  end

  def new
    @business = User.find_by(slug: params[:business])
    @business_admin = User.new
  end

  def create
    business = User.find_by(slug: params[:business])
    @business_admin = User.new(user_params)
    @business_admin.employer_id = business.id

    if @business_admin.save
      flash.now[:success] = "Business Admin successfully created."
      redirect_to business_administrative_management_index_path(business: business.slug)
    else
      flash.now[:danger] = @business_admin.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @business_admin = User.find(params[:id])
  end

  def update
    @business_admin = User.find(params[:id])
    if @business_admin.update(user_params)
      flash.now[:success] = "Business Admin successfully edited."
      redirect_to business_administrative_management_index_path(business: @business_admin.employer.slug)
    else
      flash.now[:danger] = @business_admin.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @business_admin = User.find(params[:id])
    @business_admin.destroy
    redirect_to business_administrative_management_index_path(business: current_user.employer.slug)
  end


  private

    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :title,
                                   :description,
                                   :username,
                                   :location,
                                   :picture,
                                   :password).merge(role: 3)
    end

end

class Admin::BusinessController < Admin::BaseController
  def update
    @business = User.find_by(id: [params[:id].to_i])
    if @business.update({business_status: params[:business_status], pending: false})
      flash[:success] = "Business status updated"
      redirect_to admin_dashboard_path
    else
      flash[:danger] = "Business Status not updated"
      redirect_to admin_dashboard_path
    end
  end

  def destroy
    @business = User.find_by(id: params[:id])
    if @business.destroy
      flash[:success] = "Business Destroyed"
      redirect_to admin_dashboard_path
    else
      flash[:danger] = "No changes made"
      redirect_to admin_dashboard_path
    end
  end

  def index
    @businesses = User.business
  end

  def change_status
    @business = User.find_by(id: params[:id])
    @business.change_business_status
    if @business.save
      flash[:success] = "#{@business.name} status changed"
      redirect_to request.referrer
    else
      flash[:danger] = "Status not changed"
      redirect_to request.referrer
    end
  end

end

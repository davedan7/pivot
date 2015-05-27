class Admin::BusinessController < Admin::BaseController
  def update
    @business = User.find_by(id: [params[:id].to_i])
    if @business.update({business_status: params[:business_status]})
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

end

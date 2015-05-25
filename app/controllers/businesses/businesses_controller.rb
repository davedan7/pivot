class Businesses::BusinessesController < ApplicationController

  def dashboard
    @business = current_user
  end

  def new_account
    @business = User.new
  end

  def create
    @business = User.new(business_params)
    if @business.save && @business.update(business_status: false)
      UserNotifier.business_registration_confirmation(@business).deliver_now
      flash[:success] = "You successfully applied for an account"
      redirect_to confirm_business_application_path(id: @business)
    else
      flash[:danger] = errors.full_messages.join(", ")
      redirect_to new_business_path
    end
  end

  def confirmation
    @business = User.find_by(id: params[:id].to_i)
  end

  private

    def business_params
      params.require(:user).permit(:name,
                                   :username,
                                   :email,
                                   :location,
                                   :description,
                                   :password
                                   ).merge(role: 1)
    end
end

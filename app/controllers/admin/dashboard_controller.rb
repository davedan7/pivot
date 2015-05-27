class Admin::DashboardController < Admin::BaseController
  def show
    @pending_businesses = User.offline_businesses
  end
end

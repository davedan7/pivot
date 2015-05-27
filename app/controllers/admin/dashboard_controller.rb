class Admin::DashboardController < Admin::BaseController
  def show
    @pending_businesses = User.pending_approval
  end
end

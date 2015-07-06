class BusinessesController < ApplicationController

  def index
    if current_admin?
      @businesses = User.business
    else
      @businesses = User.business.online_businesses
    end
  end

end

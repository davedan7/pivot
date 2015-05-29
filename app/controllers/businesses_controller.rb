class BusinessesController < ApplicationController

  def index
    if current_admin?
      @businesses = User.business
    else
      @businesses = User.business.online_businesses
    end
  end

  # def correct_priveleges
  #   current_business? || current_admin? || current_business_admin?
  # end

end

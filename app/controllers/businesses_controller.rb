class BusinessesController < ApplicationController

  def index
    if current_admin?
      @businesses = User.business
    elsif
      @businesses = User.business.online_businesses
    end
  end

end

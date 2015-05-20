class BusinessesController < ApplicationController

  def index
    @businesses = User.business
  end
end

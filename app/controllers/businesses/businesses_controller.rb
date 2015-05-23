class Businesses::BusinessesController < ApplicationController

  def dashboard
    @business = current_user
  end

end

class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
  end

  def index
    @categories = Category.all
  end
  
end

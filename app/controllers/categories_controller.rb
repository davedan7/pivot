class CategoriesController < ApplicationController

  def show
    @category = Category.friendly.find(params[:id])
    @jobs = @category.jobs
  end

  def index
    @categories = Category.all
  end

end

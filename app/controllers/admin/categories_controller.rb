class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @category = Category.friendly.find(params[:id])
  end

  def edit
    @category = Category.friendly.find(params[:id])
  end

  def update
    @category = Category.friendly.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category has been updated!"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :edit
    end
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category was successfully created!"
      redirect_to admin_categories_path
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    @category = Category.friendly.find(params[:id])
    if @category.can_destroy? && @category.destroy
      flash[:success] = "Category successfully deleted!"
      redirect_to admin_categories_path(id: @category.id)
    else
      flash[:error] = @category.errors.full_messages.join(", ")
      redirect_to admin_categories_path(id: @category.id)
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end

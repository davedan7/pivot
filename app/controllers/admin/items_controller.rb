class Admin::ItemsController < Admin::BaseController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @categories = Category.all
    @item       = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      categories = params[:item][:category_ids].reject(&:empty?)
      categories.each do |id|
        @item.categories << Category.find(id)
      end
      flash[:notice] = "#{@item.title} created!"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @item       = Item.find(params[:id])
    @categories = Category.all
  end

  def update
    @item = Item.find(params[:id])
    categories = params[:item][:category_ids].reject(&:empty?)
    if @item.update(item_params)
      @item.modify_status(params[:status])
      @item.categories.destroy_all
      categories.each do |id|
        @item.categories << Category.find(id)
      end
      flash[:notice] = "#{@item.title} Updated"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:title,
                                 :description,
                                 :price,
                                 :status,
                                 :image,
                                 :category_ids)
  end
end

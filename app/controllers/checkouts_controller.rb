class CheckoutsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    if item.retired
      flash[:errors] = "Retired item cannot be added to cart"
      redirect_to categories_path
    else
      @cart.add_item(item.id)
      session[:cart] = @cart.contents
      flash[:notice] = "You now have #{pluralize(@cart.count_of(item.id), item.title)} in your cart.  "
      redirect_to categories_path
    end
  end

  def show
    @items = @cart.find_items
    @item_quantities = @cart.contents
  end

  def confirmation
    @items           = @cart.find_valid_items
    @item_quantities = @cart.contents
    if @items.empty?
      flash[:errors] = "Reality Check! Cart can't be empty!"
      redirect_to categories_path
    end
  end

  def increase
    @cart.increase_quantity(params[:item_id])
    redirect_to checkout_path
  end

  def decrease
    @cart.decrease_quantity(params[:item_id])
    redirect_to checkout_path
  end

  def remove
    item = @cart.remove_item(params[:item_id])
    redirect_to checkout_path
  end
end

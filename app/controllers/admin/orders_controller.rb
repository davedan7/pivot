class Admin::OrdersController < Admin::BaseController
  def dashboard
    @orders   = Order.all
    @statuses = ["all", "ordered", "completed", "paid", "cancelled"]
    render :dashboard
  end

  def show
    @order = Order.find_by(id: params[:order_id].to_i)
  end

  def update
    order = Order.find_by(id: params[:order_id].to_i)
    if order.update(status: params[:status])
      flash[:notice] = "Order #{order.id} status changed to #{params[:status]}"
      redirect_to admin_order_path(order_id: order.id)
    else
      flash[:error] = order.errors.full_messages.join(", ")
      redirect_to admin_order_path(order_id: order.id)
    end
  end
end

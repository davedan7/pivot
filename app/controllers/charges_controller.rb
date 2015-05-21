class ChargesController < ApplicationController

  def new
  end

  def create
    @amount = current_user.orders.first.subtotal

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :card  => params[:stripeToken]
    )

    if Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd' )

        current_user.orders.first.paid!
    end

      rescue Stripe::CardError => e
      flash[:danger] = e.message
      redirect_to charges_path
  end

  private

  def stripe_params
    params.permit(:stripeToken, :stripeEmail)
  end
end

class Api::OrdersController < ApplicationController
  def index
  end

  def show
  end

  def create
    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
    )
    if @order.save
      @order.subtotal = @order.product.price * @order.quantity
      @order.tax = @order.subtotal * 0.09
      @order.total = @order.subtotal + @order.tax
      @order.save
      render "show.json.jb"
    end
  end
end

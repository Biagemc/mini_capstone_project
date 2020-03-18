class Api::OrdersController < ApplicationController
  def index
    # p "*" * 20
    # p current_user
    # p "*" * 20
    if current_user
      @orders = current_user.orders
    else
      @orders = []
    end
    render "index.json.jb"
  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jb"
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

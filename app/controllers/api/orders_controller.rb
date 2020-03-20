class Api::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    @orders = current_user.orders
    render "index.json.jb"
  end

  def show
    @order = Order.find(params[:id])
    render "show.json.jb"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    the_subtotal = params[:quantity].to_i * product.price
    tax_rate = 0.09
    the_tax = the_subtotal * tax_rate
    the_total = the_subtotal + the_tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: the_subtotal,
      tax: the_tax,
      total: the_total,
    )
    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: :bad_request
    end
  end
end

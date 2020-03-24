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
    @carted_products = current_user.carted_products.where(status: "carted")

    tax_rate = 0.09
    the_subtotal = 0
    the_tax = 0
    @carted_products.each do |carted_product|
      the_subtotal += carted_product.quantity * carted_product.product.price
      the_tax += the_subtotal * tax_rate
      # carted_product.carted_products.status = "purchased"
      # carted_product.carted_products.order_id = @order[:id]
    end
    the_total = the_subtotal + the_tax

    @order = Order.new(
      user_id: current_user.id,
      subtotal: the_subtotal,
      tax: the_tax,
      total: the_total,
    )
    # product.carted_products.status = "purchased"
    # product.carted_products.order_id = @order[:id]

    if @order.save
      render "show.json.jb"
    else
      render json: { errors: @order.errors.full_messages }, status: :bad_request
    end
  end
end

# @carted_products = current_user.carted_products.where(status: 'carted')
#     subtotal = 0
#     tax = 0
#     @carted_products.each do |carted_product|
#       subtotal += carted_product.quantity * carted_product.product.price
#       tax += carted_product.quantity * carted_product.product.tax
#     end
#     # add up all the price * quantities for a subtotal
#     total = subtotal + tax
